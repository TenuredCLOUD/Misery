#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Generator
 * Spawns a POI based on a composition defined in description.ext
 *
 * Arguments:
 * 0: POI Data <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_generate;
 *
 * Public: No
*/

if (!isServer) exitWith {};

params ["_poi", "_pos"];

if (!(_pos isEqualTypeArray [0, 0, 0]) || {_pos isEqualTo [0, 0, 0]}) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid position for POI %1: %2", (_poi select 0), _pos]] call EFUNC(common,debugMessage);
};

_pos = [_pos select 0, _pos select 1, 0];

_poi params [
    "_poiID", // 0
    "_composition", // 1
    "_position", // 2
    "_nearShore", // 3
    "_groundLoot", // 4
    "_faction", // 5
    "_aiClass", // 6
    "_aiCountMax", // 7
    "_aiCountMin", // 8
    "_aiSpawnDistance", // 9
    "_aiWeapPrimaryLoot", // 10
    "_aiWeapSecondaryLoot", // 11
    "_aiWeapLauncherLoot", // 12
    "_aiAmmo", // 13
    "_aiItemLoot", // 14
    "_aiNVGLoot", // 15
    "_aiFacewearLoot", // 16
    "_aiHeadgearLoot", // 17
    "_aiUniformLoot", // 18
    "_aiVestLoot", // 19
    "_aiBackpackLoot", // 20
    "_crateWeaponLoot", // 21
    "_crateWeaponMagLoot", // 22
    "_crateWeaponAttachmentLoot", // 23
    "_crateItemLoot", // 24
    "_crateUniformLoot", // 25
    "_crateVestLoot", // 26
    "_crateBackpackLoot", // 27
    "_crateLootCount", // 28
    "_groundLootItems", // 29
    "_groundLootCount", // 30
    "_aiAccuracy", // 31
    "_aiShake", // 32
    "_aiSpeed", // 33
    "_spawnChance", // 34
    "_poiSpawned", // 35
    "_spawnedObjects", // 36
    "_group" // 37
];

// Store spawn position
GVAR(activePositions) set [_poiID, _pos];

private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];
_usedPositions pushBack _pos;

GVAR(usedPositions) set [_poiID, _usedPositions];

if (!(_composition isEqualType [])) then {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Composition for POI %1 is not an array: %2", _poiID, _composition]] call EFUNC(common,debugMessage);
    _composition = [];
};

if (count _composition >= 3) then {
    for "_i" from 0 to (count _composition - 3) step 3 do {
        private _class = _composition select _i;
        private _relPos = _composition select (_i + 1);
        private _dir = _composition select (_i + 2);

        if (!(_class isEqualType "") || !(_relPos isEqualType []) || !(_dir isEqualType 0)) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid composition entry for POI %1 at index %2: %3, %4, %5", _poiID, _i, _class, _relPos, _dir]] call EFUNC(common,debugMessage);
            continue;
        };

        private _objPos = _pos vectorAdd _relPos;
        private _obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
        if (isNull _obj) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Failed to create object %1 for POI %2 at %3", _class, _poiID, _objPos]] call EFUNC(common,debugMessage);
            continue;
        };

        _obj setPosATL [_objPos select 0, _objPos select 1, 0];
        _obj setDir _dir;
        _obj enableDynamicSimulation true;
        _spawnedObjects pushBack _obj;

        if (_class in ["Land_Campfire_F", "Land_FirePlace_F"] && [50] call EFUNC(common,rollChance)) then {
            _obj inflame true;
        };

        if (_class isKindOf "ReammoBox_F") then {
            clearMagazineCargoGlobal _obj;
            clearWeaponCargoGlobal _obj;
            clearItemCargoGlobal _obj;
            clearBackpackCargoGlobal _obj;
            [_obj, _crateWeaponLoot, _crateWeaponMagLoot, _crateWeaponAttachmentLoot, _crateItemLoot, _crateUniformLoot, _crateVestLoot, _crateBackpackLoot, _crateLootCount] call FUNC(populateCrate);
        };

        if (GVAR(wrecksSmoke)) then {
            if (_class isKindOf "Wreck_base_F") then {
                private _wreckPos = getPosATL _obj;
                private _smokeEffect = "#particlesource" createVehicle _wreckPos;
                _smokeEffect setParticleParams [
                ["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1], "", "Billboard",
                1, 15, [0, 0, 0], [0, 0, 5],
                0, 10, 7.9, 0.066, [2, 5, 8],
                [[0, 0, 0, 0], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.1, 0.1, 0.1, 0.5], [0.125, 0.125, 0.125, 0]],
                [0.25], 1, 0, "", "", _smokeEffect];
                _smokeEffect setParticleRandom [0, [0.5, 0.5, 0], [0.3, 0.3, 0.5], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
                _smokeEffect setDropInterval 0.05;
                _spawnedObjects pushBack _smokeEffect;
            };
        };
    };
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Composition for POI %1 has insufficient elements: %2", _poiID, _composition]] call EFUNC(common,debugMessage);
};

if (_groundLoot isEqualTo 1 && {count _groundLootItems > 0}) then {
    for "_i" from 1 to _groundLootCount do {
        private _item = selectRandom _groundLootItems;
        private _safePos = [_pos, 1, 10, 1, 0, 20, 0] call BIS_fnc_findSafePos;
        if (_safePos isEqualTo []) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["No safe position found for ground loot %1 for POI %2", _item, _poiID]] call EFUNC(common,debugMessage);
            continue;
        };
        private _holder = createVehicle ["GroundWeaponHolder", _safePos, [], 0, "CAN_COLLIDE"];
        if (isNull _holder) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Failed to create GroundWeaponHolder for item %1 at %2 for POI %3", _item, _safePos, _poiID]] call EFUNC(common,debugMessage);
            continue;
        };
        _holder setPosATL [_safePos select 0, _safePos select 1, 0];
        _holder addItemCargoGlobal [_item, 1];
        _spawnedObjects pushBack _holder;
    };
};

if (_aiClass isNotEqualTo "") then {
    _group = createGroup (switch (_faction) do {
        case "SIDEWEST": {west};
        case "SIDEEAST": {east};
        case "SIDECIVILIAN": {civilian};
        case "SIDEIND": {independent};
        default {sideUnknown};
    });
    private _numEntities = [_aiCountMin, _aiCountMax] call BIS_fnc_randomInt;
    for "_i" from 1 to _numEntities do {
        private _randomWeaponLoadout = [0, 5] call BIS_fnc_randomInt;
        private _randomVestLoadout = [1, 2] call BIS_fnc_randomInt;
        private _randomBackpackLoadout = [1, 2] call BIS_fnc_randomInt;
        private _randomNVGLoadout = [1, 2] call BIS_fnc_randomInt;
        private _randomFacewearLoadout = [1, 2] call BIS_fnc_randomInt;
        private _randomHeadgearLoadout = [1, 2] call BIS_fnc_randomInt;
        private _randomAmmoCount = [1, _aiAmmo] call BIS_fnc_randomInt;
        private _safePos = [_pos, 0, _aiSpawnDistance, 1, 0, 20, 0] call BIS_fnc_findSafePos;
        private _unit = _group createUnit [_aiClass, _safePos, [], 0, "FORM"];

        removeAllWeapons _unit;
        removeAllItems _unit;
        removeAllAssignedItems _unit;
        removeUniform _unit;
        removeVest _unit;
        removeBackpack _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        if (_randomWeaponLoadout isEqualTo 0) then {
            if (count _aiWeapPrimaryLoot > 0) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
            if (count _aiWeapSecondaryLoot > 0) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
            if (count _aiWeapLauncherLoot > 0) then {[_unit, selectRandom _aiWeapLauncherLoot, 0] call BIS_fnc_addWeapon};
        };
        if (_randomWeaponLoadout isEqualTo 1) then {
            if (count _aiWeapPrimaryLoot > 0) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
        };
        if (_randomWeaponLoadout isEqualTo 2) then {
            if (count _aiWeapSecondaryLoot > 0) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
        };
        if (_randomWeaponLoadout isEqualTo 3) then {
            if (count _aiWeapPrimaryLoot > 0) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
            if (count _aiWeapSecondaryLoot > 0) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
        };
        if (_randomWeaponLoadout isEqualTo 4) then {
            if (count _aiWeapPrimaryLoot > 0) then {[_unit, selectRandom _aiWeapPrimaryLoot, 0] call BIS_fnc_addWeapon};
            if (count _aiWeapLauncherLoot > 0) then {[_unit, selectRandom _aiWeapLauncherLoot, 0] call BIS_fnc_addWeapon};
        };
        if (_randomWeaponLoadout isEqualTo 5) then {
            if (count _aiWeapSecondaryLoot > 0) then {[_unit, selectRandom _aiWeapSecondaryLoot, 0] call BIS_fnc_addWeapon};
            if (count _aiWeapLauncherLoot > 0) then {[_unit, selectRandom _aiWeapLauncherLoot, 0] call BIS_fnc_addWeapon};
        };

        if (count _aiUniformLoot > 0) then {_unit forceAddUniform selectRandom _aiUniformLoot};
        if (_randomVestLoadout isEqualTo 1 && {count _aiVestLoot > 0}) then {_unit addVest selectRandom _aiVestLoot};
        if (_randomBackpackLoadout isEqualTo 1 && {count _aiBackpackLoot > 0}) then {_unit addBackpack selectRandom _aiBackpackLoot};
        if (_randomNVGLoadout isEqualTo 1 && {count _aiNVGLoot > 0}) then {_unit linkItem selectRandom _aiNVGLoot};
        if (_randomFacewearLoadout isEqualTo 1 && {count _aiFacewearLoot > 0}) then {_unit addGoggles selectRandom _aiFacewearLoot};
        if (_randomHeadgearLoadout isEqualTo 1 && {count _aiHeadgearLoot > 0}) then {_unit addHeadgear selectRandom _aiHeadgearLoot};

        if ((_unit ammo (primaryWeapon _unit)) isEqualTo 0) then {
            private _magazineArrayP = getArray (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
            if (_magazineArrayP isNotEqualTo []) then {
                private _magP = _magazineArrayP select 0;
                for "_j" from 1 to _randomAmmoCount do {_unit addMagazine _magP};
            };
        };
        if ((_unit ammo (handgunWeapon _unit)) isEqualTo 0) then {
            private _magazineArrayH = getArray (configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
            if (_magazineArrayH isNotEqualTo []) then {
                private _magH = _magazineArrayH select 0;
                for "_j" from 1 to _randomAmmoCount do {_unit addMagazine _magH};
            };
        };
        if ((_unit ammo (secondaryWeapon _unit)) isEqualTo 0) then {
            private _magazineArrayS = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
            if (_magazineArrayS isNotEqualTo []) then {
                private _magS = _magazineArrayS select 0;
                for "_j" from 1 to _randomAmmoCount do {_unit addMagazine _magS};
            };
        };

        reload _unit;
        _unit setSkill ["aimingAccuracy", _aiAccuracy];
        _unit setSkill ["aimingShake", _aiShake];
        _unit setSkill ["aimingSpeed", _aiSpeed];

        if ([50] call EFUNC(common,rollChance)) then {_unit action ["sitDown", _unit];};
    };

    {
        if (count _aiItemLoot > 0) then {
            for "_i" from 1 to 5 do {_x addItem (selectRandom _aiItemLoot);};
        };
    } forEach (units _group);

    private _taskDorP = [1, 2] call BIS_fnc_randomInt;
    if (_taskDorP isEqualTo 1) then {
        [_group, _pos, _aiSpawnDistance] call BIS_fnc_taskPatrol;
    } else {
        [_group, _pos] call BIS_fnc_taskDefend;
    };

    _group setCombatMode "RED";
    _group setBehaviour "SAFE";
    _group enableDynamicSimulation true;
};

_poi set [35, true];
_poi set [36, _spawnedObjects];
_poi set [37, _group];

GVAR(activeCount) = GVAR(activeCount) + 1;

if (EGVAR(common,debugMode) >= 1) then {
    private _markerName = format ["POI_%1", _poiID];
    private _marker = createMarkerLocal [_markerName, _pos];
    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerSizeLocal [0.5, 0.5];
    _marker setMarkerAlphaLocal 1;
    _marker setMarkerText format ["[Misery POI] POI %1", _poiID];
    _poi pushBack _marker;
};

if (!isNil "grad_persistence_blacklist") then {
    private _classes = _composition select { _forEachIndex mod 3 isEqualTo 0 };
    {
        if ((grad_persistence_blacklist find (toLower _x) isEqualTo -1) && (grad_persistence_blacklist find (toUpper _x) isEqualTo -1)) then {
            [_x] call grad_persistence_fnc_blacklistClasses;
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Blacklisted class %1 for GRAD persistence", _x]] call EFUNC(common,debugMessage);
        };
    } forEach _classes;
};
