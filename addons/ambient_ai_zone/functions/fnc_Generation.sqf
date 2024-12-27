#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI Zones Generator
 * Generates highly reactive AI built to a scenario designers module layout
 * Works with zone stepping, so different modules can generate different factions etc... (more robust than the ambient spawner)
 *
 * Arguments:
 * 0: Module the spawner is assigned to <OBJECT>
 * 1: faction to spawn by the module <STRING>
 * 2: Class of AI to be generated <STRING>
 * 3: Max allowed size of group <NUMBER>
 * 4: Primary weapon loot for AI <ARRAY>
 * 5: Secondary weapon loot for AI <ARRAY>
 * 6: Launcher weapon loot for AI <ARRAY>
 * 7: Ammo ammount possible (slected randomly) <NUMBER>
 * 8: Possible item loot in AI inventories <ARRAY>
 * 9: Possible Night vision loot for AI <ARRAY>
 * 10: Possible Facewear loot for AI <ARRAY>
 * 11: Possible Headgear loot for AI <ARRAY>
 * 12: Possible Uniform loot for AI <ARRAY>
 * 13: Possible Vest loot for AI <ARRAY>
 * 14: Possible backpack loot for AI <ARRAY>
 * 15: AI Accuracy <NUMBER>
 * 16: AI Shake <NUMBER>
 * 17: AI Speed <NUMBER>
 * 18: Group Spawn Chance <NUMBER>
 * 19: Minimum spawn distance from module object for group <NUMBER>
 * 20: Maximum spawn distance from module object for group <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 * _module,
 * (_module getVariable QCLASS(AI_faction)),
 * (_module getVariable QCLASS(AI_Class)),
 * (_module getVariable QCLASS(AI_GroupMAX)),
 * (_module getVariable QCLASS(AI_WeapPrimaryLoot)),
 * (_module getVariable QCLASS(AI_WeapSecondaryLoot)),
 * (_module getVariable QCLASS(AI_WeaplauncherLoot)),
 * (_module getVariable QCLASS(AI_Ammo)),
 * (_module getVariable QCLASS(AI_ItemLoot)),
 * (_module getVariable QCLASS(AI_NVGLoot)),
 * (_module getVariable QCLASS(AI_FacewearLoot)),
 * (_module getVariable QCLASS(AI_HeadgearLoot)),
 * (_module getVariable QCLASS(AI_UniformLoot)),
 * (_module getVariable QCLASS(AI_VestLoot)),
 * (_module getVariable QCLASS(AI_BackpackLoot)),
 * (_module getVariable QCLASS(AI_Accuracy)),
 * (_module getVariable QCLASS(AI_Shake)),
 * (_module getVariable QCLASS(AI_Speed)),
 * (_module getVariable QCLASS(AI_SpawnChance)),
 * (_module getVariable QCLASS(AI_ModuleSpawnDistanceMIN)),
 * (_module getVariable QCLASS(AI_ModuleSpawnDistanceMAX))
 * ] call misery_ambient_ai_zone_fnc_Generation;
 *
 * Public: No
*/

private [
"_module",
"_faction",
"_markerShow",
"_ZoneRadius",
"_aiClass",
"_Population",
"_aiCountMax",
"_aiLootarray",
"_aimingAccuracy",
"_aimingShake",
"_aimingSpeed",
"_player",
"_players",
"_pos",
"_group",
"_numEntities",
"_SpawnFLAG",
"_spawnedAIs",
"_Spawnchance",
"_spawnPos",
"_unit",
"_randomWeapon",
"_randomItem",
"_randomUniform",
"_randomVest",
"_randomBackpack",
"_deleteFlag"
];

if !(isServer) exitWith {};

//Params:
_module = _this select 0;

//Get module inputs:
_faction = switch (_this select 1) do {
    case "SIDEWEST": {west};
    case "SIDEEAST": {east};
    case "SIDECIVILIAN": {civilian};
    case "SIDEIND": {independent};
    default {sideUnknown}; // Use sideUnknown as default
};

_aiClass = _this select 2;
_aiCountMax = _this select 3;
_aiWeapPrimaryLoot = (_this select 4) call EFUNC(common,parseArray);
_aiWeapSecondaryLoot = (_this select 5) call EFUNC(common,parseArray);
_aiWeaplauncherLoot = (_this select 6) call EFUNC(common,parseArray);
_aiAmmo = _this select 7;
_aiitemArray = (_this select 8) call EFUNC(common,parseArray);
_aiNVGLoot = (_this select 9) call EFUNC(common,parseArray);
_aiFacewearLoot = (_this select 10) call EFUNC(common,parseArray);
_aiHeadgearLoot = (_this select 11) call EFUNC(common,parseArray);
_aiuniformArray = (_this select 12) call EFUNC(common,parseArray);
_aivestArray = (_this select 13) call EFUNC(common,parseArray);
_aibackpackArray = (_this select 14) call EFUNC(common,parseArray);
_aimingAccuracy = _this select 15;
_aimingShake = _this select 16;
_aimingSpeed = _this select 17;
_Spawnchance = _this select 18;
_ModuleSpawnDistanceMIN = _this select 19;
_ModuleSpawnDistanceMAX = _this select 20;

_player=objNull;
_players=call EFUNC(common,listPlayers);

_pos = getPos _module;

_group = createGroup _faction; //create group with defined side + delete group when empty

_numEntities = [1, _aiCountMax] call BIS_fnc_randomInt;

_SpawnFLAG = false;

_AI_Spawnblacklist = [];
{
    _marker = createMarkerLocal [format ["playerMarker_%1", _forEachIndex], getPos _x];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [10, 10];
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerAlpha 0;

    _AI_Spawnblacklist pushBack _marker;
} forEach _players;


_spawnPos = [_pos, _ModuleSpawnDistanceMIN, _ModuleSpawnDistanceMAX, 10, 0, 0, 0, _AI_Spawnblacklist] call BIS_fnc_findSafePos;

{
    deleteMarker _x;
} forEach _AI_Spawnblacklist;

if (Misery_active_AmbAI_Groups >= Misery_AmbAI_MAXAllowed) exitWith {

    if (EGVAR(common,debug)) then {
            systemChat "[Misery Ambient_AI Framework] exiting AI Generation due to max active AI groups allowed value being reached";
    };

    //Start cooldown before retry:
    sleep 120;

    _module setVariable [QCLASS(AI_Zone_Spawned), false, true];
};

//Spawn chance check:
if ((random 100) > _Spawnchance) exitWith {
if (EGVAR(common,debug)) then {systemChat format["[Misery Ambient_AI Framework] Spawn chance failed, exiting Generation for AI at %1 checks will be re-initialized next game session...",getPosATL _module]};

//This AI generator is now null from spawning since the original check failed
};

if (EGVAR(common,debug)) then {systemChat format["[Misery Ambient_AI Framework] Player detected near module at %1 Generating AI Group...",getPosATL _module]};

// Create the entities
for "_i" from 1 to _numEntities do {
    _randomweaploadout = [0,5] call BIS_fnc_randomInt;
    _randomvestloadout = [1,2] call BIS_fnc_randomInt;
    _randombackpackloadout = [1,2] call BIS_fnc_randomInt;
    _randomNVGloadout = [1,2] call BIS_fnc_randomInt;
    _randomFacewearloadout = [1,2] call BIS_fnc_randomInt;
    _randomHeadgearloadout = [1,2] call BIS_fnc_randomInt;
    _randomammocount = [1,_aiAmmo] call BIS_fnc_randomInt;
    _unit = _group createUnit [_aiClass, _spawnPos, [], 0, "FORM"];

    _unit addEventHandler ["Killed", {
    params ["_unit"];
    addToRemainsCollector [_unit];
    }];

    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    if (_randomweaploadout == 0) then {
    if (!isNil "_aiWeapPrimaryLoot" && {count _aiWeapPrimaryLoot > 0}) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
    if (!isNil "_aiWeapSecondaryLoot" && {count _aiWeapSecondaryLoot > 0}) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
    if (!isNil "_aiWeaplauncherLoot" && {count _aiWeaplauncherLoot > 0}) then {[_unit, selectRandom _aiWeaplauncherLoot, 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 1) then {
    if (!isNil "_aiWeapPrimaryLoot" && {count _aiWeapPrimaryLoot > 0}) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 2) then {
    if (!isNil "_aiWeapSecondaryLoot" && {count _aiWeapSecondaryLoot > 0}) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 3) then {
    if (!isNil "_aiWeapPrimaryLoot" && {count _aiWeapPrimaryLoot > 0}) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
    if (!isNil "_aiWeapSecondaryLoot" && {count _aiWeapSecondaryLoot > 0}) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 4) then {
    if (!isNil "_aiWeapPrimaryLoot" && {count _aiWeapPrimaryLoot > 0}) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
    if (!isNil "_aiWeaplauncherLoot" && {count _aiWeaplauncherLoot > 0}) then {[_unit, selectRandom _aiWeaplauncherLoot, 0] call BIS_fnc_addWeapon};
    };

    if (_randomweaploadout == 5) then {
    if (!isNil "_aiWeapSecondaryLoot" && {count _aiWeapSecondaryLoot > 0}) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
    if (!isNil "_aiWeaplauncherLoot" && {count _aiWeaplauncherLoot > 0}) then {[_unit, selectRandom _aiWeaplauncherLoot, 0] call BIS_fnc_addWeapon};
    };

    if (!isNil "_aiuniformArray" && {count _aiuniformArray > 0}) then {_unit forceAddUniform selectRandom _aiuniformArray};

    if (_randomvestloadout == 1) then {
    if (!isNil "_aivestArray" && {count _aivestArray > 0}) then {_unit addVest selectRandom _aivestArray};
    };

    if (_randombackpackloadout == 1) then {
    if (!isNil "_aibackpackArray" && {count _aibackpackArray > 0}) then {_unit addBackpack selectRandom _aibackpackArray};
    };

    if (_randomNVGloadout == 1) then {
    if (!isNil "_aiNVGLoot" && {count _aiNVGLoot > 0}) then {_unit linkItem selectRandom _aiNVGLoot};
    };

    if (_randomFacewearloadout == 1) then {
    if (!isNil "_aiFacewearLoot" && {count _aiFacewearLoot > 0}) then {_unit addGoggles selectRandom _aiFacewearLoot};
    };

    if (_randomHeadgearloadout == 1) then {
    if (!isNil "_aiHeadgearLoot" && {count _aiHeadgearLoot > 0}) then {_unit addHeadgear selectRandom _aiHeadgearLoot};
    };

    if ((_unit ammo (primaryWeapon _unit)) isEqualTo 0) then {
        _magazinearrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
        if !(_magazinearrayP isEqualTo []) then {
            _magP = _magazinearrayP select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magP;};
        };
    };

    if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
        _magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
        if !(_magazinearrayH isEqualTo []) then {
            _magH = _magazinearrayH select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magH;};
        };
    };

    if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
        _magazinearrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
        if !(_magazinearrayS isEqualTo []) then {
            _magS = _magazinearrayS select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magS;};
        };
    };

    reload _unit;

    _unit setSkill ["aimingAccuracy", _aimingAccuracy];
    _unit setSkill ["aimingShake", _aimingShake];
    _unit setSkill ["aimingSpeed", _aimingSpeed];

    if !(EGVAR(common,checkMultiplayer)) then {
    if (side _unit isEqualTo side player) then {
        private _equipmentMass = loadAbs _unit / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
        private _recruitmentCost = 500 * round(_equipmentMass * 100);
        private _Unitidentity = name _unit;

        [
            _unit,
            format [localize "STR_MISERY_RECRUITUNIT", _Unitidentity, EGVAR(money,symbol), [_recruitmentCost] call Misery_fnc_formatNumber],
            "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
            "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
            "_this distance _target < 3",
            "_caller distance _target < 3",
            {},
            {},
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                private _recruitmentCost = _arguments select 0;
                private _Unitidentity = _arguments select 1;
                private _playerMoney = _caller getVariable QCLASS(currency);
                if (_playerMoney >= _recruitmentCost) then {
                    _caller setVariable [QCLASS(currency), _playerMoney - _recruitmentCost];
                    [_target] joinSilent _caller;
                    [_target,_actionId] call BIS_fnc_holdActionRemove;
                    private _recruitSuccess = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_RECRUITUNIT_SUCCESS", _Unitidentity, EGVAR(money,symbol), [_recruitmentCost] call Misery_fnc_formatNumber]];
                    [parseText _recruitSuccess, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
                }else{
                    private _recruitFail = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_RECRUITUNIT_FAIL",_Unitidentity]];
                    [parseText _recruitFail, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
                };
            },
            {},
            [_recruitmentCost, _Unitidentity],
            0.1,
            nil,
            false,
            false
        ] call BIS_fnc_holdActionAdd;
        };
    };
};

{
 if (!isNil "_aiitemArray" && {count _aiitemArray > 0}) then {
    for "_i" from 1 to 5 do {_x addItem (selectRandom _aiitemArray);};
    };
} forEach (units _group);

_group enableDynamicSimulation true;

if (EGVAR(common,debug)) then {
    _randID = str (diag_tickTime * 1e6) + str _module;
    _markerName = format ["AI Group %1", _randID];
    _marker = createMarkerLocal [_markerName, getPosATL leader _group];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerSizeLocal [0.5, 0.5];
    _marker setMarkerAlphaLocal 1;
    _marker setMarkerText "[DEBUG] Generated AI Group Spawn";
};

Misery_active_AmbAI_Groups = Misery_active_AmbAI_Groups + 1;

[_group] spawn {
    private _group = _this select 0;

    while {{alive _x} count units _group > 0} do {

        {
            _x enableGunLights "forceOn";
        } forEach units _group;

        private _world = worldSize;
        private _axis = worldSize / 2;
        private _center = [_axis, _axis , 0];
        private _radius = sqrt 2 * _axis;

        private _waypoint = [_center, _axis, _axis, 10, 0, 0, 0] call BIS_fnc_findSafePos;
        [_group, _waypoint, 500, 10, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol;

        private _building = nearestBuilding leader _group;
        if (_building distance leader _group < 100 && ((round(random 100)) < (round(random 100)))) then {
            [_group] call CBA_fnc_taskDefend;
        };
        sleep 120;
    };
};

_deleteFlag = false;

waitUntil {
    sleep Misery_AmbAI_DeleteTimer;
    {
        _player=_x;
        if ((_player distance leader _group) < Misery_AmbAI_DeleteCheckDistance) then {
            _deleteFlag = false;
        }else{
            _deleteFlag = true;
        };
    } forEach _players;
    _deleteFlag
};

if (_deleteFlag) exitWith {
if (EGVAR(common,debug)) then {systemChat format["[Misery Ambient_AI Framework] Player no longer detected, or Group for module at %1 was wiped out...",getPosATL _module]};
{deleteVehicle _x} forEach units _group; // Delete all units in the group
deleteGroup _group; // Delete the group
if (EGVAR(common,debug)) then {systemChat format["[Misery Ambient_AI Framework] Re-initializing AI Generation for module at %1...",getPosATL _module]};
_module setVariable [QCLASS(AI_Zone_Spawned), false, true];
if (EGVAR(common,debug) && {!isNil "_marker"}) then {
        deleteMarker _marker;
    };

Misery_active_AmbAI_Groups = Misery_active_AmbAI_Groups - 1;

};
