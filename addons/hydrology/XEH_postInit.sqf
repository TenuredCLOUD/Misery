#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

[
    "hydrology_menu",
    localize "STR_MISERY_COLLECTWATER",
    {call EFUNC(common,nearWell)},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(hydrology_ui);
    },
    "",
    QPATHTOEF(icons,data\well_ca.paa),
    ""
] call EFUNC(actions,addAction);
