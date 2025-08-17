#include "script_component.hpp"

// Exit system if ACE repair is enabled
if (!isNil "ace_repair_enabled" && {ace_repair_enabled}) exitWith {};

if (isServer) then {
    call FUNC(initVehicles);

    [
        "maintenance_menu",
        "Vehicle Maintenance",
        {([player] call EFUNC(common,nearVehicle)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(maintenance_ui);
        },
        "",
        "",
        ""
    ] call EFUNC(actions,addAction);
};

if (hasInterface) then {
    call FUNC(engineControl);
};
