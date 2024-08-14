#include "..\script_component.hpp"
/*
Misery Ballistics modifier startup
Checks what ammunition game or targets are hit with, if not safe ammunition, target is obliterated
Should be JIP and MP compatible due to third parameter being used for active entity EH handling...
Designed specifically for Misery mod
by TenuredCLOUD

Needs to run on server, and is manually refreshed every 30 seconds, all safe ammunition also needs to be listed one by one...
It is generally a good idea to wait until Misery Client is loaded...

Usage Ex:

waitUntil {sleep 1; !isNil "MiseryClientReady"};
if (!isNil "MiseryClientReady") then {
["Rabbit_F", ["B_9x21_Ball", "B_12Gauge_Pellets"]] call Misery_fnc_BallisticsModifier;
};
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
        if (_x getVariable ["Misery_SG_EH_added", false] == false) then {
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

