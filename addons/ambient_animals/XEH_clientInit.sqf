#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(disableEnvironment)) then {
    enableEnvironment [false, true];
};

