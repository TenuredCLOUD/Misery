#include "script_component.hpp"

if !(isServer) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_POI")) then {
    GVAR(activeCount) = 0;
    GVAR(activePositions) = createHashMap;
    GVAR(usedPositions) = createHashMap;
    GVAR(spawnAttempts) = createHashMap;

    [QGVAR(processGeneration), {
        params ["_poi", "_spawnPos"];
        [_poi, _spawnPos] call FUNC(generate);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(processCleanup), {
        params ["_poi"];
        [_poi] call FUNC(cleanup);
    }] call CBA_fnc_addEventHandler;

    [] call FUNC(parseData);
};
