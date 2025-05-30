#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [] call FUNC(monitor);
};
