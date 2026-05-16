#include "script_component.hpp"

if (isMultiplayer) exitWith {};

private _sleepAction = [
    QGVAR(sleep_menu),
    "Sleep",
    QPATHTOEF(icons,data\bed_ca.paa),
    {
        createDialog QCLASS(sleepMenu_ui);
    },
    {
        call FUNC(condition);
    }
] call ACEFUNC(interact_menu,createAction);

[player, 1, [QUOTE(ACE_SelfActions)], _sleepAction] call ACEFUNC(interact_menu,addActionToObject);
