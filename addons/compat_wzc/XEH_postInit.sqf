#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};

[QGVAR(convertToZed), {
    params ["_unit", "_animParams"];
    _unit switchMove (_animParams select 0);
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    if (GVAR(infectionEnabled)) then {
        call FUNC(infect);
    };
    if (GVAR(zedEnabled)) then {
        call FUNC(checkInfection);
    };
};

if (!isServer) exitWith {};

GVAR(markerSizeX) = GVAR(minimumDistance) + GVAR(safeDistance);
GVAR(markerSizeY) = GVAR(maximumDistance) + GVAR(safeDistance);
GVAR(registeredEntities) = [];

["CBA_loadingScreenDone", {
    call FUNC(convertToArray);
    call FUNC(loop);
    call FUNC(loiter);
}] call CBA_fnc_addEventHandler;

// set resistance faction / IND to enemy to all others to fix faction issues with WebZC
resistance setFriend [west, 0];
resistance setFriend [east, 0];
resistance setFriend [civilian, 0];

west setFriend [resistance, 0];
east setFriend [resistance, 0];
civilian setFriend [resistance, 0];
