#include "script_component.hpp"
#include "XEH_PREP.hpp"

if (GVAR(enabled) == true) then {
    [{[] call FUNC(parsedData)}, [], 1] call CBA_fnc_waitAndExecute;
};