#include "script_component.hpp"
#include "XEH_PREP.hpp"

if (GVAR(enabled)) then {
    [{[] call FUNC(loop)}, [], 1] call CBA_fnc_waitAndExecute;
};