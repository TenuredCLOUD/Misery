#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Generator (Heli-Wreck)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_heliWreck;
 *
 * Public: No
*/

private [
    "_module",
    "_pos",
    "_spawnedObjects",
    "_crateTypes",
    "_maxCrates",
    "_minCrates",
    "_crateCount",
    "_maxallowedCrates",
    "_maxallowedCrateitems",
    "_ammoBox",
    "_players",
    "_SpawnFLAG",
    "_spawnedPOIs",
    "_POIrestartchecks",
    "_Spawnchance",
    "_deleteFlag",
    "_WreckTypes",
    "_crateweaponArray",
    "_crateweaponMagArray",
    "_crateweaponAttchArray",
    "_crateitemArray",
    "_crateuniformArray",
    "_cratevestArray",
    "_cratebackpackArray",
    "_heliWreck",
    "_smoke",
    "_heliPos",
    "_spawnPos",
    "_marker",
    "_WreckID",
    "_posStr",
    "_Wreckalert"
];

if !(isServer) exitWith {};

// Params:
_module = _this select 0;

_spawnedObjects = [];

_pos = getPos _module;

_maxCrates = _this select 1;
_minCrates = _this select 2;
_crateTypes = (_this select 3) call EFUNC(common,parseArray);

_maxCratesitems = _this select 4;
_minCratesitems = _this select 5;

_crateCount = 0;

_maxallowedCrates = [_minCrates,_maxCrates] call BIS_fnc_randomInt;
_maxallowedCrateitems = [_minCratesitems,_maxCratesitems] call BIS_fnc_randomInt;

_WreckTypes = (_this select 6) call EFUNC(common,parseArray);

_Spawnchance = _this select 7;

_crateweaponArray = (_this select 8) call EFUNC(common,parseArray);
_crateweaponMagArray = _this select 9;
_crateweaponAttchArray = _this select 10;
_crateitemArray = (_this select 11) call EFUNC(common,parseArray);
_crateuniformArray = (_this select 12) call EFUNC(common,parseArray);
_cratevestArray = (_this select 13) call EFUNC(common,parseArray);
_cratebackpackArray = (_this select 14) call EFUNC(common,parseArray);

_player=objNull;
_players=call Misery_fnc_ListPlayers;
_players=_players-(entities "HeadlessClient_F");

_SpawnFLAG = false;

if (Misery_activePOIs >= Misery_POIMAXAllowed) exitWith {

    if (MiseryDebug) then {
            systemChat "[Misery POI Framework] exiting Generation for Heli-Wreck due to max active POI's allowed value being reached";
    };

    //Start cooldown before retry:
    sleep 120;

_module setVariable ["Misery_POI_Spawned", false, true];

};

//Spawn chance check:
if ((random 100) > _Spawnchance) exitWith {
if (MiseryDebug) then {systemChat format["[Misery POI Framework] Spawn chance failed, exiting Generation for Heli-Wreck at %1 checks will be re-initialized next game session...",getPosATL _module]};

//This POI is now null from spawning since the original check failed

};

_heliWreck = selectRandom _WreckTypes createVehicle ([_pos, 0, 5 + (random 20), 1, 0, 20, 0] call BIS_fnc_findSafePos);
_heliWreck setDir (random 360);
_spawnedObjects pushBack _heliWreck;
_heliWreck enableDynamicSimulation true;

_smoke = "test_EmptyObjectForSmoke" createVehicle getPos _heliWreck;
_smoke attachTo [_heliWreck, [0,0,0]];
_spawnedObjects pushBack _smoke;

_heliPos = getPos _heliWreck;

for "_i" from 1 to _maxallowedCrates do {
    _spawnPos = [_heliPos, 5, 25] call BIS_fnc_findSafePos;

    _ammoBox = selectRandom _crateTypes createVehicle _spawnPos;
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
    _maxallowedCrateitems] execVM "\z\misery\addons\poi\functions\fnc_PopulateCrate.sqf";
};

// _WreckID = _module getVariable ["Wreck_ID", nil];
// if (isNil "_WreckID") then {
//     _WreckID = 0;
// };

// _WreckID = str (diag_tickTime * 1e6) + str _module;
// _module setVariable ["Active_Wreck_ID", _WreckID, true];

// _posStr = str _pos;
// _Wreckalert = [_posStr, _WreckID];
// [_Wreckalert, "\z\misery\addons\poi\scripts\Modules\PDA\alerts\HeliWreck.sqf"] remoteExec ["execVM ", 0];

Misery_activePOIs = Misery_activePOIs + 1;

//If GRAD persistence is active, push Holders to blacklister for saving so POI objects won't save / reload (This will execute only once)
if (!isNil "grad_persistence_blacklist") then {
    {
        if ((grad_persistence_blacklist find (toLower _x) == -1) && (grad_persistence_blacklist find (toUpper _x) == -1)) then {
            [_x] call grad_persistence_fnc_blacklistClasses;
            if (MiseryDebug) then {systemChat format ["[Misery POI Framework] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]};
        };
    } forEach (_WreckTypes + _crateTypes);
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
    {deleteVehicle _x} forEach _spawnedObjects; // Delete all spawned objects
     _module setVariable ["Misery_POI_Spawned", false, true];
    //  _WreckID = _module getVariable "Active_Wreck_ID";
    //  _marker = missionNamespace getVariable [format ["Wreck_Marker_%1", _WreckID], ""];
if (_marker != "") then {
    // [_marker] remoteExec ["deleteMarkerLocal", 0];
    // missionNamespace setVariable [format ["Wreck_Marker_%1", _WreckID], nil];
};

Misery_activePOIs = Misery_activePOIs - 1;

};
