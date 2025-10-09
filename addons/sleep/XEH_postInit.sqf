#include "script_component.hpp"

if (isMultiplayer) exitWith {};

[
    "sleep_menu",
    "Sleep",
    {call FUNC(condition)},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(sleepMenu_ui);
    },
    "",
    QPATHTOEF(icons,data\sleepy_ca.paa),
    ""
] call EFUNC(actions,addAction);
