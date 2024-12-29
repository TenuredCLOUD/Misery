#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI AI Generator (Campground)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_campground;
 *
 * Public: No
*/

private [
"_module",
"_spawnedObjects",
"_faction",
"_aiClass",
"_aiCountMax",
"_aiCountMin",
"_aiSpawnDistance",
"_aiLootarray",
"_crateLootarray",
"_crateItemsMAX",
"_crateItemsMIN",
"_spawnedobjectsMAX",
"_spawnedObjectsMIN",
"_spawnedCratesMAX",
"_spawnedCratesMIN",
"_tentTypes",
"_crateTypes",
"_aimingAccuracy",
"_aimingShake",
"_aimingSpeed",
"_player",
"_players",
"_pos",
"_group",
"_numEntities",
"_SpawnFLAG",
"_spawnedPOIs",
"_Spawnchance",
"_POIrestartchecks",
"_spawnPos",
"_unit",
"_randomWeapon",
"_randomItem",
"_randomUniform",
"_randomVest",
"_randomBackpack",
"_maxTents",
"_minTents",
"_tentCount",
"_crateCount",
"_maxallowedTents",
"_maxallowedCrates",
"_maxallowedCrateitems",
"_entityPositions",
"_tents",
"_tent",
"_fireplace",
"_ammoBox",
"_deleteFlag"
];

if !(isServer) exitWith {};

//Params:
_module = _this select 0;

_spawnedObjects = [];

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
_aiCountMin = _this select 4;
_aiSpawnDistance = _this select 5;
_aiWeapPrimaryLoot = (_this select 6) call EFUNC(common,parseArray);
_aiWeapSecondaryLoot = (_this select 7) call EFUNC(common,parseArray);
_aiWeaplauncherLoot = (_this select 8) call EFUNC(common,parseArray);
_aiAmmo = _this select 9;
_aiitemArray = (_this select 10) call EFUNC(common,parseArray);
_aiNVGLoot = (_this select 11) call EFUNC(common,parseArray);
_aiFacewearLoot = (_this select 12) call EFUNC(common,parseArray);
_aiHeadgearLoot = (_this select 13) call EFUNC(common,parseArray);
_aiuniformArray = (_this select 14) call EFUNC(common,parseArray);
_aivestArray = (_this select 15) call EFUNC(common,parseArray);
_aibackpackArray = (_this select 16) call EFUNC(common,parseArray);
_crateweaponArray = (_this select 17) call EFUNC(common,parseArray);
_crateweaponMagArray = _this select 18;
_crateweaponAttchArray = _this select 19;
_crateitemArray = (_this select 20) call EFUNC(common,parseArray);
_crateuniformArray = (_this select 21) call EFUNC(common,parseArray);
_cratevestArray = (_this select 22) call EFUNC(common,parseArray);
_cratebackpackArray = (_this select 23) call EFUNC(common,parseArray);
_crateItemsMAX = _this select 24;
_crateItemsMIN = _this select 25;
_spawnedobjectsMAX = _this select 26;
_spawnedObjectsMIN = _this select 27;
_spawnedCratesMAX = _this select 28;
_spawnedCratesMIN = _this select 29;
_tentTypes = (_this select 30) call EFUNC(common,parseArray);
_crateTypes = (_this select 31) call EFUNC(common,parseArray);

_aimingAccuracy = _this select 32;
_aimingShake = _this select 33;
_aimingSpeed = _this select 34;
_Spawnchance = _this select 35;

_player=objNull;
_players=call EFUNC(common,listPlayers);
_players=_players-(entities "HeadlessClient_F");

_pos = getPos _module;

_group = createGroup _faction; //create group with defined side + delete group when empty

_numEntities = [_aiCountMax,_aiCountMin] call BIS_fnc_randomInt;

_SpawnFLAG = false;

if (Misery_activePOIs >= Misery_POIMAXAllowed) exitWith {

    if (EGVAR(common,debug)) then {
            systemChat "[Misery POI Framework] exiting Generation for Campground due to max active POI's allowed value being reached";
    };

    //Start cooldown before retry:
    sleep 120;

    _module setVariable [QCLASS(poiSpawned), false, true];

};

//Spawn chance check:
if ((random 100) > _Spawnchance) exitWith {
if (EGVAR(common,debug)) then {systemChat format["[Misery POI Framework] Spawn chance failed, exiting Generation for Campground at %1 checks will be re-initialized next game session...",getPosATL _module]};

//This POI is now null from spawning since the original check failed

};

if (EGVAR(common,debug)) then {systemChat format["[Misery POI Framework] Player detected near module at %1 Generating Campground...",getPosATL _module]};

// Create the entities
for "_i" from 1 to _numEntities do {
    _randomweaploadout = [0,5] call BIS_fnc_randomInt;
    _randomvestloadout = [1,2] call BIS_fnc_randomInt;
    _randombackpackloadout = [1,2] call BIS_fnc_randomInt;
    _randomNVGloadout = [1,2] call BIS_fnc_randomInt;
    _randomFacewearloadout = [1,2] call BIS_fnc_randomInt;
    _randomHeadgearloadout = [1,2] call BIS_fnc_randomInt;
    _randomammocount = [1,_aiAmmo] call BIS_fnc_randomInt;
    _spawnPos = [_pos, 0, _aiSpawnDistance, 1, 0, 20, 0] call BIS_fnc_findSafePos;
    _unit = _group createUnit [_aiClass, _spawnPos, [], 0, "FORM"];

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
        if (_magazinearrayP isNotEqualTo []) then {
            _magP = _magazinearrayP select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magP;};
        };
    };

    if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
        _magazinearrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
        if (_magazinearrayH isNotEqualTo []) then {
            _magH = _magazinearrayH select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magH;};
        };
    };

    if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
        _magazinearrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
        if (_magazinearrayS isNotEqualTo []) then {
            _magS = _magazinearrayS select 0;
            for "_j" from 1 to _randomammocount do {_unit addMagazine _magS;};
        };
    };

    reload _unit;

    _unit setSkill ["aimingAccuracy", _aimingAccuracy];
    _unit setSkill ["aimingShake", _aimingShake];
    _unit setSkill ["aimingSpeed", _aimingSpeed];
};

{
 if (!isNil "_aiitemArray" && {count _aiitemArray > 0}) then {
    for "_i" from 1 to 5 do {_x addItem (selectRandom _aiitemArray);};
    };
} forEach (units _group);

_taskDorP = [1,2] call BIS_fnc_randomInt;

    if (_taskDorP == 1) then {
        [_group, getPos leader _group, _aiSpawnDistance] call bis_fnc_taskPatrol;
    } else {
        [_group, getPos leader _group] call BIS_fnc_taskDefend;
    };

_group setCombatMode "RED";
_group setBehaviour "SAFE";

//Enforce Dynamic Simulation per generated AI unit per group
_group enableDynamicSimulation true;

_maxTents = _spawnedobjectsMAX;
_minTents = _spawnedObjectsMIN;

_maxCrates = _spawnedCratesMAX;
_minCrates = _spawnedCratesMIN;

_tentCount = 0;
_crateCount = 0;

_maxallowedTents = [_spawnedObjectsMIN,_spawnedobjectsMAX] call BIS_fnc_randomInt;
_maxallowedCrates = [_spawnedCratesMIN,_spawnedCratesMAX] call BIS_fnc_randomInt;
_maxallowedCrateitems = [_crateItemsMIN,_crateItemsMAX] call BIS_fnc_randomInt;

_entityPositions = units _group apply {getPos _x};
{
    _pos = _x findEmptyPosition [5, _aiSpawnDistance, _tentTypes select 0];

    if (_tentCount < _maxallowedTents) then {
        _tents = [1,2] call BIS_fnc_randomInt;
        for "_i" from 1 to _tents do {
            _tent = selectRandom _tentTypes createVehicle ([_pos, 0, 5 + (random 50), 1, 0, 20, 0] call BIS_fnc_findSafePos);
            _tent setDir (random 360);

            _spawnedObjects pushBack _tent;
            _tentCount = _tentCount + 1;

            _tent enableDynamicSimulation true;
        };

    _fireplace = "Land_Fireplace_F" createVehicle ([_pos, 0, 5 + (random 25), 1, 0, 20, 0] call BIS_fnc_findSafePos);
    _fireplace setDir (random 360);
    if ((random 10) > 5) then {_fireplace inflame true};
    _spawnedObjects pushBack _fireplace;

    _fireplace enableDynamicSimulation true;
    };

    if (_crateCount < _maxallowedCrates) then {
    _ammoBox = selectRandom _crateTypes createVehicle ([_pos, 0, 5 + (random 25), 1, 0, 20, 0] call BIS_fnc_findSafePos);
    _ammoBox setDir (random 360);
    clearMagazineCargoGlobal _ammoBox;
    clearWeaponCargoGlobal _ammoBox;
    clearItemCargoGlobal _ammoBox;
    clearBackpackCargoGlobal _ammoBox;

    _spawnedObjects pushBack _ammoBox;
    _crateCount = _crateCount + 1;

    _ammoBox enableDynamicSimulation true;

    [_ammoBox,
    _crateweaponArray,
    _crateweaponMagArray,
    _crateweaponAttchArray,
    _crateitemArray,
    _crateuniformArray,
    _cratevestArray,
    _cratebackpackArray,
    _maxallowedCrateitems] call FUNC(populateCrate);
};

} forEach _entityPositions;

{
if ((random 10) > 5) then {
_x action ["sitDown", _x]};
} forEach (units _group);

if (EGVAR(common,debug)) then {
    _randID = str (diag_tickTime * 1e6) + str _module;
    _markerName = format ["Campground %1", _randID];
    _marker = createMarkerLocal [_markerName, _pos];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerSizeLocal [0.5, 0.5];
    _marker setMarkerAlphaLocal 1;
    _marker setMarkerText "[DEBUG] Campground POI";
};

Misery_activePOIs = Misery_activePOIs + 1;

//If GRAD persistence is active, push Holders to blacklister for saving so POI objects won't save / reload (This will execute only once)
if (!isNil "grad_persistence_blacklist") then {
    {
        if ((grad_persistence_blacklist find (toLower _x) == -1) && (grad_persistence_blacklist find (toUpper _x) == -1)) then {
            [_x] call grad_persistence_fnc_blacklistClasses;
            if (EGVAR(common,debug)) then {systemChat format ["[Misery POI Framework] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]};
        };
    } forEach (_tentTypes + _crateTypes);
};

_deleteFlag = false;

waitUntil {
    sleep Misery_POIDeleteTimer;
    {
        _player=_x;
        if ((_player distance _pos) < Misery_POIDeleteCheckDistance) then {
            _deleteFlag = false;
        } else {
            _deleteFlag = true;
        };
    } forEach _players;
    _deleteFlag
};

if (_deleteFlag) exitWith {
if (EGVAR(common,debug)) then {systemChat format["[Misery POI Framework] Player no longer detected, deleting Campground at %1...",getPosATL _module]};
{deleteVehicle _x} forEach units _group; // Delete all units in the group
{deleteVehicle _x} forEach _spawnedObjects;
deleteGroup _group; // Delete the group
if (EGVAR(common,debug)) then {systemChat format["[Misery POI Framework] Re-initializing Campground POI for module at %1...",getPosATL _module]};
_module setVariable [QCLASS(poiSpawned), false, true];
if (EGVAR(common,debug) && {!isNil "_marker"}) then {
        deleteMarker _marker;
    };

Misery_activePOIs = Misery_activePOIs - 1;

};
