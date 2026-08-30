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

if !(isServer) exitWith {};

params [["_poi", createHashMap, [createHashMap]], ["_pos", [0, 0, 0], [[]]]];

if (_pos isEqualTo [0, 0, 0]) exitWith {};

_pos = [_pos select 0, _pos select 1, 0];

private _poiID = _poi get "id";
private _composition = _poi get "composition";
private _spawnedObjects = [];

GVAR(activePositions) set [_poiID, _pos];

private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];

_usedPositions pushBack _pos;

GVAR(usedPositions) set [_poiID, _usedPositions];

if (count _composition >= 3) then {

    for "_i" from 0 to (count _composition - 3) step 3 do {

        private _class = _composition select _i;
        private _relPos = _composition select (_i + 1);
        private _dir = _composition select (_i + 2);

        private _objPos = _pos vectorAdd _relPos;

        private _obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];

        if (isNull _obj) then { continue };

        _obj setDir _dir;

        _objPos set [2, getTerrainHeightASL [_objPos select 0, _objPos select 1]];

        _obj setPosASL _objPos;

        _obj setVectorUp (surfaceNormal _objPos);

        _obj enableDynamicSimulation true;
        _obj setVariable [QGRADGVAR(persistence,isExcluded), true];

        _spawnedObjects pushBack _obj;

        if (_class in ["Land_Campfire_F", "Land_FirePlace_F"] && {[50] call EFUNC(common,rollChance)}) then {
            _obj inflame true;
        };

        if (_class isKindOf "ReammoBox_F") then {

            _obj setVariable [QEGVAR(gear_cache,ignore), true, true];

            clearMagazineCargoGlobal _obj;
            clearWeaponCargoGlobal _obj;
            clearItemCargoGlobal _obj;
            clearBackpackCargoGlobal _obj;

            [
                _obj,
                _poi get "crateWeaponLoot",
                _poi get "crateWeaponMagLoot",
                _poi get "crateWeaponAttachmentLoot",
                _poi get "crateItemLoot",
                _poi get "crateUniformLoot",
                _poi get "crateVestLoot",
                _poi get "crateBackpackLoot",
                _poi get "crateLootCount"
            ] call FUNC(populateCrate);
        };

        if (GVAR(wrecksSmoke) && {_class isKindOf "Wreck_base_F"}) then {

            private _smokeEffect = "#particlesource" createVehicle (getPosATL _obj);

            _smokeEffect setParticleParams [
                ["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1], "", "Billboard",
                1, 15, [0, 0, 0], [0, 0, 5], 0, 10, 7.9, 0.066, [2, 5, 8],
                [[0, 0, 0, 0], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.1, 0.1, 0.1, 0.5], [0.125, 0.125, 0.125, 0]],
                [0.25], 1, 0, "", "", _smokeEffect
            ];

            _smokeEffect setParticleRandom [0, [0.5, 0.5, 0], [0.3, 0.3, 0.5], 0, 0.5, [0, 0, 0, 0.1], 0, 0];
            _smokeEffect setDropInterval 0.05;
            _smokeEffect setVariable [QGRADGVAR(persistence,isExcluded), true];
            _spawnedObjects pushBack _smokeEffect;
        };
    };
};

if (_poi get "groundLoot" && {count (_poi get "groundLootItems") > 0}) then {

    private _items = _poi get "groundLootItems";

    for "_i" from 1 to (_poi get "groundLootCount") do {

        private _safePos = [_pos, 1, 10, 1, 0, 20, 0] call BIS_fnc_findSafePos;

        if (_safePos isEqualTo []) then { continue };

        private _holder = createVehicle ["GroundWeaponHolder", _safePos, [], 0, "CAN_COLLIDE"];

        if (isNull _holder) then { continue };

        _holder setPosATL [_safePos select 0, _safePos select 1, 0];
        _holder addItemCargoGlobal [selectRandom _items, 1];

        _holder setVariable [QGRADGVAR(persistence,isExcluded), true];

        _spawnedObjects pushBack _holder;
    };
};

private _aiClass = _poi get "aiClass";

private _group = grpNull;

if (_aiClass isNotEqualTo "") then {

    _group = createGroup (switch (_poi get "faction") do {
        case "SIDEWEST": {west};
        case "SIDEEAST": {east};
        case "SIDECIVILIAN": {civilian};
        case "SIDEIND": {independent};
        default {sideUnknown};
    });

    private _numEntities = [_poi get "aiCountMin", _poi get "aiCountMax"] call BIS_fnc_randomInt;

    for "_i" from 1 to _numEntities do {

        private _safePos = [_pos, 0, _poi get "aiSpawnDistance", 1, 0, 20, 0] call BIS_fnc_findSafePos;

        private _unit = _group createUnit [_aiClass, _safePos, [], 0, "FORM"];

        removeAllWeapons _unit;
        removeAllItems _unit;
        removeAllAssignedItems _unit;
        removeUniform _unit;
        removeVest _unit;
        removeBackpack _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        if (count (_poi get "aiUniformLoot") > 0) then {
            _unit forceAddUniform (selectRandom (_poi get "aiUniformLoot"));
        };

        if (([50] call EFUNC(common,rollChance)) && {count (_poi get "aiVestLoot") > 0}) then {
            _unit addVest (selectRandom (_poi get "aiVestLoot"));
        };

        if (([50] call EFUNC(common,rollChance)) && {count (_poi get "aiBackpackLoot") > 0}) then {
            _unit addBackpack (selectRandom (_poi get "aiBackpackLoot"));
        };

        if (([50] call EFUNC(common,rollChance)) && {count (_poi get "aiNVGLoot") > 0}) then {
            _unit linkItem (selectRandom (_poi get "aiNVGLoot"));
        };

        if (([50] call EFUNC(common,rollChance)) && {count (_poi get "aiFacewearLoot") > 0}) then {
            _unit addGoggles (selectRandom (_poi get "aiFacewearLoot"));
        };

        if (([50] call EFUNC(common,rollChance)) && {count (_poi get "aiHeadgearLoot") > 0}) then {
            _unit addHeadgear (selectRandom (_poi get "aiHeadgearLoot"));
        };

        private _randomLoadout = [0, 5] call BIS_fnc_randomInt;

        if (_randomLoadout in [0, 1, 3, 4] && {count (_poi get "aiWeapPrimaryLoot") > 0}) then {
            [_unit, selectRandom (_poi get "aiWeapPrimaryLoot"), 0] call BIS_fnc_addWeapon;
        };

        if (_randomLoadout in [0, 2, 3, 5] && {count (_poi get "aiWeapSecondaryLoot") > 0}) then {
            [_unit, selectRandom (_poi get "aiWeapSecondaryLoot"), 0] call BIS_fnc_addWeapon;
        };

        if (_randomLoadout in [0, 4, 5] && {count (_poi get "aiWeapLauncherLoot") > 0}) then {
            [_unit, selectRandom (_poi get "aiWeapLauncherLoot"), 0] call BIS_fnc_addWeapon;
        };

        private _ammoCount = [1, _poi get "aiAmmo"] call BIS_fnc_randomInt;

        {
            private _weap = _x;

            if (_weap isNotEqualTo "") then {

                private _mags = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");

                if (_mags isNotEqualTo []) then {
                    for "_j" from 1 to _ammoCount do { _unit addMagazine (_mags select 0); };
                };
            };
        } forEach [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit];

        reload _unit;

        _unit setSkill ["aimingAccuracy", _poi get "aiAccuracy"];
        _unit setSkill ["aimingShake", _poi get "aiShake"];
        _unit setSkill ["aimingSpeed", _poi get "aiSpeed"];

        [_unit, _unit] call ACEFUNC(common,claim);
        [_unit, "because"] call ACEFUNC(common,muteUnit);

        if !(isMultiplayer) then {
            [_unit] call EFUNC(ambient_ai,addRecruitOption);
            [_unit] call EFUNC(ambient_ai,addGearOption);
        };

        if (EGVAR(currency,corpseHasMoneyChance) > 0) then {
            _unit setVariable [QEGVAR(currency,canSearch), true, true];
            if ([EGVAR(currency,corpseHasMoneyChance)] call EFUNC(common,rollChance)) then {
                private _cashFound = [EGVAR(currency,minAiMoney), EGVAR(currency,maxAiMoney)] call BIS_fnc_randomInt;
                _unit setVariable [QEGVAR(currency,funds), _cashFound, true];
            } else {
                _unit setVariable [QEGVAR(currency,funds), 0, true];
            };
        };
    };

    if (count (_poi get "aiItemLoot") > 0) then {
        {
            for "_i" from 1 to 5 do { _x addItem (selectRandom (_poi get "aiItemLoot")); };
        } forEach (units _group);
    };

    // Make group defend & patrol POI
    [_group, getPosATL leader _group, 25, 3, 1, 0] call CBA_fnc_taskDefend;

    {
        _x enableGunLights "forceOn";
    } forEach (units _group);

    _group setCombatMode "RED";
    _group setBehaviour "SAFE";
    _group enableDynamicSimulation true;
    _group setVariable [QGRADGVAR(persistence,isExcluded), true];
};

_poi set ["isSpawned", true];
_poi set ["spawnedObjects", _spawnedObjects];
_poi set ["group", _group];

GVAR(activeCount) = GVAR(activeCount) + 1;

if (EGVAR(common,debugMode) >= 1) then {

    private _markerName = format ["POI_%1", _poiID];
    private _marker = createMarkerLocal [_markerName, _pos];

    _marker setMarkerTypeLocal "mil_dot";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerSizeLocal [0.5, 0.5];
    _marker setMarkerText format ["[Misery POI] %1", _poiID];
    _poi set ["marker", _marker];
};
