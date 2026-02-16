#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        [{
            call FUNC(inArea);
        }, [], 1] call CBA_fnc_waitAndExecute;

        // Process shell type array
        [{
            if (GVAR(shellTypes) isEqualType "") then {
                GVAR(shellTypes) = parseSimpleArray GVAR(shellTypes);
            };
        }, [], 1] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
