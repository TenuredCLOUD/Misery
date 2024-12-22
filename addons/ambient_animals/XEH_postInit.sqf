#include "script_component.hpp"
#include "XEH_PREP.hpp"

if (!isServer) exitWith {};
if (!GVAR(ambientWildlife) exitWith {};

GVAR(markerSizeX) = GVAR(animalMinimumDistance) + GVAR(animalSafeDistance);
GVAR(markerSizeY) = GVAR(animalMaximumDistance) + GVAR(animalSafeDistance);
GVAR(registeredEntities) = [];

[] call FUNC(loop);
