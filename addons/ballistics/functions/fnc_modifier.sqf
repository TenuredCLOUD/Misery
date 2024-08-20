#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ballistics modifier 
 * 
 *
 * Arguments:
 * 0: animal or unit classname to modify <CLASSNAME>
 * 1: safe ammunition that won't obliterate unit <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Rabbit_F", ["B_9x21_Ball", "B_12Gauge_Pellets"]] call misery_ballistics_fnc_modifier;
 *
*/

params ["_entityType", "_allowedAmmo"];

_Misery_SGTypes = [_entityType] call EFUNC(common,parseArray);
_Misery_SGAmmo = [_allowedAmmo] call EFUNC(common,parseArray);

if (isServer) then {
    Misery_BMEntities = [];
    publicVariable "Misery_BMEntities";
};

[_Misery_SGTypes, _Misery_SGAmmo] spawn {
params ["_Misery_SGTypes", "_Misery_SGAmmo"];
while {true} do {
{
    _type = _x;
    {
        if !(_x getVariable ["Misery_SG_EH_added", false]) then {
            _x setVariable ["Misery_SG_allowedAmmo", _Misery_SGAmmo, true];
            _x addEventHandler ["HandleDamage", {_this call Misery_fnc_DamageMod}];
            _x setVariable ["Misery_SG_EH_added", true, true];

            Misery_BMEntities pushBack _x;
            publicVariable "Misery_BMEntities";
        };
    } forEach (allMissionObjects _type);
} forEach _Misery_SGTypes;

Misery_BMEntities = Misery_BMEntities select {alive _x};
publicVariable "Misery_BMEntities";

sleep 30;
    };
};

Misery_fnc_DamageMod = {
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

    private _SGname = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");

    private _allowedAmmo = _unit getVariable "Misery_SG_allowedAmmo";

    systemChat format ["Allowed ammo: %1", _allowedAmmo];
    systemChat format ["Projectile: %1", _projectile];

   // if (_projectile in _allowedAmmo) exitWith {};
    private _SafeAmmoFound = _allowedAmmo findIf {_x isEqualTo _projectile};
    systemChat str _SafeAmmoFound;
    if (_SafeAmmoFound != -1) exitWith {};

    if (isPlayer _instigator) then {

    titleText [format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_ANIMALOBLITERATED", _SGname]], "PLAIN DOWN", -1, true, true];

        private _Bloodsplatter = ["BloodPool_01_Medium_New_F", "BloodSplatter_01_Medium_New_F", "BloodSplatter_01_Small_New_F", "BloodSpray_01_New_F"];
        private _RandomBlood = selectRandom _Bloodsplatter;
        private _CorpseBlood = createVehicle [_RandomBlood, getPos _unit, [], 0, "CAN_COLLIDE"];

        deleteVehicle _unit;

        _time = time + 30;
        [_time,_CorpseBlood] spawn {
            params ["_TimeA", "_CorpseBlood"];
            waitUntil {(time > _TimeA)};
            deleteVehicle _CorpseBlood;
        };
    };
};

