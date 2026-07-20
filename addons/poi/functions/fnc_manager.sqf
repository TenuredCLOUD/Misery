#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Manger loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_manager;
 *
 * Public: No
*/

if !(isServer) exitWith {};

[{
    params ["_args", "_handle"];

    private _players = call EFUNC(common,listPlayers);

    if (_players isEqualTo []) exitWith {};

    private _selectedPlayer = selectRandom _players;

    private _playerPos = getPosATL _selectedPlayer;

    {
        private _poi = _x;
        private _poiID = _poi get "id";
        private _pos = _poi get "position";
        private _nearShore = _poi get "nearShore";
        private _isSpawned = _poi get "isSpawned";

        if (_isSpawned) then {

            private _activePos = GVAR(activePositions) getOrDefault [_poiID, _pos];

            private _cleanup = true;

            {
                if ((_x distance2D _activePos) < GVAR(deleteCheckDistance)) exitWith {
                    _cleanup = false;
                };
            } forEach _players;

            if (_cleanup) then {

                [QGVAR(processCleanup), [_poi]] call CBA_fnc_globalEvent;

                GVAR(spawnAttempts) deleteAt _poiID;
            };
        } else {

            if (GVAR(activeCount) >= GVAR(maxActive)) then { continue };

            if ((random 100) > (_poi get "spawnChance")) then { continue };

            private _spawnPos = +_pos;

            private _attemptsData = GVAR(spawnAttempts) getOrDefault [_poiID, [0, 5]];

            private _attempts = _attemptsData select 0;
            private _maxAttempts = _attemptsData select 1;

            if (_attempts >= _maxAttempts) then {

                GVAR(spawnAttempts) deleteAt _poiID;
                continue;
            };

            private _positionValid = false;

            // Random spawns
            if (_pos isEqualTo [0, 0, 0]) then {

                private _radius = [500, GVAR(spawnRandomDistance)] call BIS_fnc_randomInt;

                private _potentialPos = [_playerPos, _radius] call CBA_fnc_randPos;

                if (_nearShore) then {
                    _spawnPos = [_potentialPos, 500, GVAR(spawnRandomDistance), 1, 0, 20, 1] call BIS_fnc_findSafePos;
                } else {
                    _spawnPos = [_potentialPos, 500, GVAR(spawnRandomDistance), 1, 0, 20, 0] call BIS_fnc_findSafePos;
                };

                if (_spawnPos isNotEqualTo []) then {
                    // set index 2 to 0 since BIS_fnc_findSafePos returns 2D position
                    _spawnPos pushBack 0;

                    private _playerTooClose = [_spawnPos, 500] call CBA_fnc_nearPlayer;

                    if (!_playerTooClose && { !(surfaceIsWater _spawnPos) }) then {

                        if (([_spawnPos] call EFUNC(common,evaluateEnvironment)) isEqualTo "URBAN" && {[98] call EFUNC(common,rollChance)}) then { continue };

                        _positionValid = true;
                    };
                };
            } else {
                // Use custom position
                if (!surfaceIsWater _spawnPos) then {
                    _positionValid = true;
                };
            };

            if (_positionValid) then {

                private _usedPositions = GVAR(usedPositions) getOrDefault [_poiID, []];

                {
                    if ((_spawnPos distance2D _x) < 150) exitWith {
                        _positionValid = false;
                    };
                } forEach _usedPositions;

                if (_positionValid) then {
                    {
                        if ((_spawnPos distance2D _y) < 500) exitWith {
                            _positionValid = false;
                        };
                    } forEach GVAR(activePositions);
                };
            };

            if (!_positionValid) then {

                GVAR(spawnAttempts) set [_poiID, [_attempts + 1, _maxAttempts]];
                continue;
            };

            GVAR(spawnAttempts) deleteAt _poiID;

            private _distance = _selectedPlayer distance2D _spawnPos;

            if (_distance < GVAR(spawnCheckDistance) && {_distance > (GVAR(spawnRandomDistance) * 0.5)}) then {
                [QGVAR(processGeneration), [_poi, _spawnPos]] call CBA_fnc_globalEvent;
            };
        };

    } forEach GVAR(data);
}, GVAR(checkInterval)] call CBA_fnc_addPerFrameHandler;
