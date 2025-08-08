#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Settings Initialization & PFH handles for spawning - cleanup
 * Reads POI definitions from description.ext
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_parseData;
 *
 * Public: No
*/

if (!isServer) exitWith {};

GVAR(list) = [];
private _pois = missionConfigFile >> "CfgMisery_POI" >> "Areas";
{
    private _poiConfig = _pois >> (configName _x);
    private _composition = getArray (_poiConfig >> "composition");

    if (!(_composition isEqualType [])) then {
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid composition for POI %1: %2", configName _x, _composition]] call EFUNC(common,debugMessage);
        _composition = [];
    } else {
        if (count _composition mod 3 isNotEqualTo 0) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Composition for POI %1 has invalid length: %2", configName _x, _composition]] call EFUNC(common,debugMessage);
            _composition = [];
        };
    };

    private _poiData = [
        configName _x, // 0
        _composition, // 1
        getArray (_poiConfig >> "position"), // 2
        getNumber (_poiConfig >> "nearShore"), // 3
        getNumber (_poiConfig >> "groundLoot"), // 4
        getText (_poiConfig >> "faction"), // 5
        getText (_poiConfig >> "aiClass"), // 6
        getNumber (_poiConfig >> "aiCountMax"), // 7
        getNumber (_poiConfig >> "aiCountMin"), // 8
        getNumber (_poiConfig >> "aiSpawnDistance"), // 9
        getArray (_poiConfig >> "aiWeapPrimaryLoot"), // 10
        getArray (_poiConfig >> "aiWeapSecondaryLoot"), // 11
        getArray (_poiConfig >> "aiWeapLauncherLoot"), // 12
        getNumber (_poiConfig >> "aiAmmo"), // 13
        getArray (_poiConfig >> "aiItemLoot"), // 14
        getArray (_poiConfig >> "aiNVGLoot"), // 15
        getArray (_poiConfig >> "aiFacewearLoot"), // 16
        getArray (_poiConfig >> "aiHeadgearloot"), // 17
        getArray (_poiConfig >> "aiUniformLoot"), // 18
        getArray (_poiConfig >> "aiVestLoot"), // 19
        getArray (_poiConfig >> "aiBackpackLoot"), // 20
        getArray (_poiConfig >> "crateWeaponLoot"), // 21
        getText (_poiConfig >> "crateWeaponMagLoot"), // 22
        getText (_poiConfig >> "crateWeaponAttachmentLoot"), // 23
        getArray (_poiConfig >> "crateItemLoot"), // 24
        getArray (_poiConfig >> "crateUniformLoot"), // 25
        getArray (_poiConfig >> "crateVestLoot"), // 26
        getArray (_poiConfig >> "crateBackpackLoot"), // 27
        getNumber (_poiConfig >> "crateLootCount"), // 28
        getArray (_poiConfig >> "groundLootItems"), // 29
        getNumber (_poiConfig >> "groundLootCount"), // 30
        getNumber (_poiConfig >> "aiAccuracy"), // 31
        getNumber (_poiConfig >> "aiShake"), // 32
        getNumber (_poiConfig >> "aiSpeed"), // 33
        getNumber (_poiConfig >> "spawnChance"), // 34
        false, // 35
        [], // 36
        objNull // 37
    ];
    GVAR(list) pushBack _poiData;
} forEach configProperties [_pois, "isClass _x"];

[{
    params ["_args", "_handle"];
    private _players = call EFUNC(common,listPlayers);
    if (_players isEqualTo []) exitWith {};

    private _selectedPlayer = selectRandom _players;
    private _playerPos = position _selectedPlayer;
    private _playerUID = getPlayerUID _selectedPlayer;
    private _markerName = format ["POI_%1_%2_%3", CBA_missionTime, _playerUID, random 100];
    private _marker = createMarkerLocal [_markerName, _playerPos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [GVAR(spawnRandomDistance), GVAR(spawnRandomDistance)];
    _marker setMarkerAlphaLocal 0;

    {
        private _poi = _x;
        private _poiID = _poi select 0;
        private _pos = _poi select 2;
        private _nearShore = _poi select 3;
        private _poiSpawned = _poi select 35;

        if (_nearShore isEqualTo 1) then {continue};

        if (_poiSpawned) then {
            private _activePos = GVAR(activePositions) getOrDefault [_poiID, [0, 0, 0]];
            if (_activePos isEqualTo [0, 0, 0]) then {
                [QUOTE(COMPONENT_BEAUTIFIED), format ["No active position for spawned POI %1, using default %2", _poiID, _pos]] call EFUNC(common,debugMessage);
                _activePos = _pos;
            };

            private _delete = true;
            {
                if (_x distance _activePos < GVAR(deleteCheckDistance)) exitWith {
                    _delete = false;
                };
            } forEach _players;

            if (_delete) then {
                [QGVAR(processCleanup), [_poi]] call CBA_fnc_globalEvent;
                GVAR(spawnAttempts) deleteAt _poiID;
            };
        } else {
            if (GVAR(activeCount) >= GVAR(maxActive)) then {continue};
            if ((random 100) > (_poi select 34)) then {continue};

            private _spawnPos = _pos;

            // Check POI's with no set positions (random placement):
            if (_pos isEqualTo [0, 0, 0]) then {
                private _attempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 0;
                private _maxAttempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 1;

                if (_attempts >= _maxAttempts) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), format ["Max attempts reached for POI %1 (%2/%3)", _poiID, _attempts, _maxAttempts]] call EFUNC(common,debugMessage);
                    GVAR(spawnAttempts) deleteAt _poiID;
                    continue;
                };

                private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];
                private _positionValid = false;

                _spawnPos = [_marker, true] call CBA_fnc_randPosArea;
                if (_spawnPos isNotEqualTo []) then {
                    if (!surfaceIsWater _spawnPos) then {
                        _positionValid = true;
                    };
                };

                if (_positionValid) then {
                    private _positionUsed = false;
                    {
                        if (_spawnPos distance _x < 50) exitWith {
                            _positionUsed = true;
                            [QUOTE(COMPONENT_BEAUTIFIED), format ["Position %1 too close to used position %2 for POI %3 (attempt %4/%5)", _spawnPos, _x, _poiID, _attempts + 1, _maxAttempts]] call EFUNC(common,debugMessage);
                        };
                    } forEach _usedPositions;

                    if (_positionUsed) then {
                        _positionValid = false;
                    };
                };

                if (!_positionValid) then {
                    GVAR(spawnAttempts) set [_poiID, [_attempts + 1, _maxAttempts]];
                    continue;
                };

                GVAR(spawnAttempts) deleteAt _poiID;
            };

            // Check POI's with set positions:
            if (_pos isNotEqualTo [0, 0, 0]) then {
                private _attempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 0;
                private _maxAttempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 1;

                if (_attempts >= _maxAttempts) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), format ["Max attempts reached for POI %1 (%2/%3)", _poiID, _attempts, _maxAttempts]] call EFUNC(common,debugMessage);
                    GVAR(spawnAttempts) deleteAt _poiID;
                    continue;
                };

                private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];
                private _positionValid = false;

                if (!surfaceIsWater _spawnPos) then {
                    _positionValid = true;
                };

                if (_positionValid) then {
                    private _positionUsed = false;
                    {
                        if (_spawnPos distance _x < 50) exitWith {
                            _positionUsed = true;
                            [QUOTE(COMPONENT_BEAUTIFIED), format ["Position %1 too close to used position %2 for POI %3 (attempt %4/%5)", _spawnPos, _x, _poiID, _attempts + 1, _maxAttempts]] call EFUNC(common,debugMessage);
                        };
                    } forEach _usedPositions;

                    if (_positionUsed) then {
                        _positionValid = false;
                    };
                };

                if (!_positionValid) then {
                    GVAR(spawnAttempts) set [_poiID, [_attempts + 1, _maxAttempts]];
                    continue;
                };

                GVAR(spawnAttempts) deleteAt _poiID;
            };

            private _distance = _selectedPlayer distance _spawnPos;
            if (_distance < GVAR(spawnCheckDistance) && _distance > (GVAR(spawnRandomDistance) * 0.5)) then {
                [QGVAR(processGeneration), [_poi, _spawnPos]] call CBA_fnc_globalEvent;
            };
        };
    } forEach GVAR(list);

    [{
        deleteMarkerLocal _this;
    }, _marker, 1] call CBA_fnc_waitAndExecute;
}, GVAR(checkInterval), []] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    private _players = call EFUNC(common,listPlayers);
    if (_players isEqualTo []) exitWith {};

    private _selectedPlayer = selectRandom _players;
    private _playerPos = position _selectedPlayer;

    {
        private _poi = _x;
        private _poiID = _poi select 0;
        private _pos = _poi select 2;
        private _nearShore = _poi select 3;
        private _poiSpawned = _poi select 35;

        if (_nearShore isNotEqualTo 1) then {continue};

        if (_poiSpawned) then {
            private _activePos = GVAR(activePositions) getOrDefault [_poiID, [0, 0, 0]];
            if (_activePos isEqualTo [0, 0, 0]) then {
                [QUOTE(COMPONENT_BEAUTIFIED), format ["No active position for spawned POI %1, using default %2", _poiID, _pos]] call EFUNC(common,debugMessage);
                _activePos = _pos;
            };

            private _delete = true;
            {
                if (_x distance _activePos < GVAR(deleteCheckDistance)) exitWith {
                    _delete = false;
                };
            } forEach _players;

            if (_delete) then {
                [QGVAR(processCleanup), [_poi]] call CBA_fnc_globalEvent;
                GVAR(spawnAttempts) deleteAt _poiID;
            };
        } else {
            if (GVAR(activeCount) >= GVAR(maxActive)) then {continue};
            if ((random 100) > (_poi select 34)) then {continue};

            private _spawnPos = _pos;

            // Check POI's with no set positions (random placement):
            if (_pos isEqualTo [0, 0, 0]) then {
                private _attempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 0;
                private _maxAttempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 1;

                if (_attempts >= _maxAttempts) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), format ["Max attempts reached for POI %1 (%2/%3)", _poiID, _attempts, _maxAttempts]] call EFUNC(common,debugMessage);
                    GVAR(spawnAttempts) deleteAt _poiID;
                    continue;
                };

                private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];
                private _positionValid = false;

                _spawnPos = [[[_playerPos, GVAR(spawnRandomDistance)]], []] call BIS_fnc_randomPos;
                if (_spawnPos isNotEqualTo []) then {
                    private _overShore = _spawnPos isFlatEmpty [-1, -1, -1, -1, 0, true];
                    if (_overShore isNotEqualTo []) then {
                        _positionValid = true;
                    };
                };

                if (_positionValid) then {
                    private _positionUsed = false;
                    {
                        if (_spawnPos distance _x < 50) exitWith {
                            _positionUsed = true;
                            [QUOTE(COMPONENT_BEAUTIFIED), format ["Position %1 too close to used position %2 for POI %3 (attempt %4/%5)", _spawnPos, _x, _poiID, _attempts + 1, _maxAttempts]] call EFUNC(common,debugMessage);
                        };
                    } forEach _usedPositions;

                    if (_positionUsed) then {
                        _positionValid = false;
                    };
                };

                if (!_positionValid) then {
                    GVAR(spawnAttempts) set [_poiID, [_attempts + 1, _maxAttempts]];
                    continue;
                };

                GVAR(spawnAttempts) deleteAt _poiID;
            };

            // Check POI's with set positions:
            if (_pos isNotEqualTo [0, 0, 0]) then {
                private _attempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 0;
                private _maxAttempts = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]] select 1;

                if (_attempts >= _maxAttempts) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), format ["Max attempts reached for POI %1 (%2/%3)", _poiID, _attempts, _maxAttempts]] call EFUNC(common,debugMessage);
                    GVAR(spawnAttempts) deleteAt _poiID;
                    continue;
                };

                private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];
                private _positionValid = false;

                if (!surfaceIsWater _spawnPos) then {
                    _positionValid = true;
                };

                if (_positionValid) then {
                    private _positionUsed = false;
                    {
                        if (_spawnPos distance _x < 50) exitWith {
                            _positionUsed = true;
                            [QUOTE(COMPONENT_BEAUTIFIED), format ["Position %1 too close to used position %2 for POI %3 (attempt %4/%5)", _spawnPos, _x, _poiID, _attempts + 1, _maxAttempts]] call EFUNC(common,debugMessage);
                        };
                    } forEach _usedPositions;

                    if (_positionUsed) then {
                        _positionValid = false;
                    };
                };

                if (!_positionValid) then {
                    GVAR(spawnAttempts) set [_poiID, [_attempts + 1, _maxAttempts]];
                    continue;
                };

                GVAR(spawnAttempts) deleteAt _poiID;
            };

            private _distance = _selectedPlayer distance _spawnPos;
            if (_distance < GVAR(spawnCheckDistance) && _distance > (GVAR(spawnRandomDistance) * 0.5)) then {
                [QGVAR(processGeneration), [_poi, _spawnPos]] call CBA_fnc_globalEvent;
            };
        };
    } forEach GVAR(list);
}, GVAR(checkIntervalShore), []] call CBA_fnc_addPerFrameHandler;
