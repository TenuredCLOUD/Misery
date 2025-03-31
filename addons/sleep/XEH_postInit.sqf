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

GVAR(energyDeficitAfterSleep) = 0;
GVAR(hungerDecrease) = 0.25;
GVAR(thirstDecrease) = 0.25;
