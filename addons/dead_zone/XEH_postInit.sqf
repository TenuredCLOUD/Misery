#include "script_component.hpp"

if (isServer) then {
    [{
        call FUNC(inArea);
    }, [], 1] call CBA_fnc_waitAndExecute;

    // Process shell type array
    [{
        if (GVAR(shellTypes) isEqualType "") then {
            GVAR(shellTypesCached) = parseSimpleArray GVAR(shellTypes);
            publicVariable QGVAR(shellTypesCached);
        };
    }, [], 1] call CBA_fnc_waitAndExecute;
};

