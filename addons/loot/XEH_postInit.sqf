#include "script_component.hpp"
#include "XEH_PREP.hpp"

if (!isServer) exitWith {};

GVAR(building_used) = [];

[{
    [] call FUNC(loop)
}, [], 1] call CBA_fnc_waitAndExecute;
