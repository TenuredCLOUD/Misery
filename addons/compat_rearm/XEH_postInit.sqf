#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (ace_rearm_enabled) then {
        call FUNC(action);
    };
}] call CBA_fnc_addEventHandler;
