#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (ACEGVAR(rearm,enabled)) then {
        call FUNC(action);
    };
}] call CBA_fnc_addEventHandler;
