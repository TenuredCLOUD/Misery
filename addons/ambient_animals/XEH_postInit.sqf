#include "script_component.hpp"

if (!isServer) exitWith {};
if (!GVAR(ambientWildlife)) exitWith {};

GVAR(animalTypes) = [
    ["Sheep_random_F", 3],
    ["Goat_random_F", 2],
    ["Cock_random_F", 1],
    ["Hen_random_F", 4]
];

GVAR(markerSizeX) = GVAR(animalMinimumDistance) + GVAR(animalSafeDistance);
GVAR(markerSizeY) = GVAR(animalMaximumDistance) + GVAR(animalSafeDistance);
GVAR(registeredEntities) = [];

["CBA_settingsInitialized", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;
