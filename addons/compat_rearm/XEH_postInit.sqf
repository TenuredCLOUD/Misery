#include "script_component.hpp"

["CBA_loadingScreenDone", {
    if (ACEGVAR(rearm,enabled)) then {
        call FUNC(action);
    };
}] call CBA_fnc_addEventHandler;
