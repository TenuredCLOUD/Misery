#include "script_component.hpp"

if (!isServer) exitWith {};

if (!GVAR(enabled)) exitWith {};

GVAR(markerSizeX) = GVAR(minimumDistance) + GVAR(safeDistance);
GVAR(markerSizeY) = GVAR(maximumDistance) + GVAR(safeDistance);
GVAR(registeredEntities) = [];

["CBA_settingsInitialized", {
    call FUNC(convertToArray);
    call FUNC(loop);
    call FUNC(patrol);
}] call CBA_fnc_addEventHandler;
