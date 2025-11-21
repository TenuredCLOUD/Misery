#include "script_component.hpp"

if (!isServer) exitWith {};
if (!GVAR(enabled)) exitWith {};

GVAR(dropZones) = [];
GVAR(activeDrops) = [];

["CBA_settingsInitialized", {
    [] call FUNC(convertToArray);
    [] call FUNC(loop);
    [] call FUNC(cleanCheck);
}] call CBA_fnc_addEventHandler;
