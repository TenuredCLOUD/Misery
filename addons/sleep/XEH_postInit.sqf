#include "script_component.hpp"

if (isServer) exitWith {};

[] call FUNC(sleepAction);

GVAR(energyDeficitAfterSleep) = 0;
GVAR(hungerDecrease) = 0.25;
GVAR(thirstDecrease) = 0.25;
