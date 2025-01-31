#include "script_component.hpp"

if (EGVAR(common,checkMultiplayer)) exitWith {};

GVAR(energyDeficitAfterSleep) = 0;
GVAR(hungerDecrease) = 0.25;
GVAR(thirstDecrease) = 0.25;
