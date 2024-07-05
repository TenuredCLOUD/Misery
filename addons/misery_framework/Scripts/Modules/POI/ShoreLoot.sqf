 /* -----------------------------------
POI Generator (Shore loot)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

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
    "_Shoreloot",
    "_smoke",
    "_ShoreLPos",
    "_spawnPos"
];

if !(isServer) exitWith {};

// Params:
_module = _this select 0;

_spawnedObjects = [];

_pos = getPos _module;

_maxCrates = _this select 1; 
_minCrates = _this select 2;
_crateTypes = (_this select 3) call Misery_fnc_ParseArray2;

_maxCratesitems = _this select 4; 
_minCratesitems = _this select 5;

_crateCount = 0;

_maxallowedCrates = [_minCrates,_maxCrates] call BIS_fnc_randomInt;
_maxallowedCrateitems = [_minCratesitems,_maxCratesitems] call BIS_fnc_randomInt;

_WreckTypes = (_this select 6) call Misery_fnc_ParseArray2;

_Spawnchance = _this select 7;

_crateweaponArray = (_this select 8) call Misery_fnc_ParseArray2;
_crateweaponMagArray = _this select 9;
_crateweaponAttchArray = _this select 10;
_crateitemArray = (_this select 11) call Misery_fnc_ParseArray2;
_crateuniformArray = (_this select 12) call Misery_fnc_ParseArray2;
_cratevestArray = (_this select 13) call Misery_fnc_ParseArray2;
_cratebackpackArray = (_this select 14) call Misery_fnc_ParseArray2;

_player=objNull;
_players=call Misery_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");

_SpawnFLAG = false;

if (Misery_activePOIs >= Misery_POIMAXAllowed) exitWith {
    
    if (MiseryDebug) then {
            systemChat "[Misery POI Framework] exiting Generation for Shoreloot due to max active POI's allowed value being reached";
    };

    //Start cooldown before retry:
    sleep 120;

_module setVariable ["Misery_POI_Spawned", false, true];

};

//Spawn chance check:
if ((random 100) > _Spawnchance) exitWith {
if (MiseryDebug) then {systemChat format["[Misery POI Framework] Spawn chance failed, exiting Generation for Shoreloot at %1 checks will be re-initialized next game session...",getPosATL _module]};

//This POI is now null from spawning since the original check failed
};

_ModuleplacementOK = FALSE; 

_overShore = !(_Pos isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []); 

if (_overShore) then { 
    _ModuleplacementOK = TRUE; 
}; 

if (_ModuleplacementOK) then {
    _Shoreloot = selectRandom _WreckTypes createVehicle ([_pos, 0, 5 + (random 20), 1, 0, 20, 1] call BIS_fnc_findSafePos);
    _ShoreLPos = getPos _Shoreloot;

    _Shoreloot setDir (random 360);
    _spawnedObjects pushBack _Shoreloot;
    _Shoreloot enableDynamicSimulation true;

    for "_i" from 1 to _maxallowedCrates do {
        _spawnPos = [_ShoreLPos, 1, 10] call BIS_fnc_findSafePos;

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
        _maxallowedCrateitems] execVM "Misery\Scripts\Modules\POI\PopulateCrate.sqf";
    };
} else {
if (MiseryDebug) then {systemChat format["[Misery POI Framework] Module at %1 is a Shore loot module, and must be placed near a shore...",getPosATL _module];};
};

if (MiseryDebug) then {
    _randID = str (diag_tickTime * 1e6) + str _module;
    _markerName = format ["Shoreloot %1", _randID];
    _marker = createMarker [_markerName, _pos];
    _marker setMarkerType "mil_dot";
    _marker setMarkerColor "ColorWhite"; 
    _marker setMarkerSize [0.5, 0.5]; 
    _marker setMarkerAlpha 1;
    _marker setMarkerText "[DEBUG] Shoreloot POI";
};

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
if (MiseryDebug && {!isNil "_marker"}) then {
        deleteMarker _marker;
    };

Misery_activePOIs = Misery_activePOIs - 1;

};