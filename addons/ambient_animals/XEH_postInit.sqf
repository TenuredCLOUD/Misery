#include "script_component.hpp"

if (!isServer) exitWith {};
if (!GVAR(ambientWildlife)) exitWith {};

GVAR(markerSizeX) = GVAR(animalMinimumDistance) + GVAR(animalSafeDistance);
GVAR(markerSizeY) = GVAR(animalMaximumDistance) + GVAR(animalSafeDistance);
GVAR(registeredEntities) = [];

["CBA_settingsInitialized", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;
