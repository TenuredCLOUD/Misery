#include "script_component.hpp"

if (isMultiplayer) exitWith {};

["CBA_loadingScreenDone", {
    private _sleepAction = [
        QGVAR(sleep_menu),
        localize LSTRING(Action),
        QPATHTOEF(icons,data\bed_ca.paa),
        {
            createDialog QCLASS(sleepMenu_ui);
        },
        {
            call FUNC(condition);
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _sleepAction] call ACEFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;
