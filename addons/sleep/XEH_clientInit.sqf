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
            call FUNC(condition) select 0;
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _sleepAction] call ACEFUNC(interact_menu,addActionToObject);

    [QCLASSACE(interactMenuOpened), {
        params ["_type"];
        if (_type isNotEqualTo 0) exitWith {};

        [] call FUNC(condition) params ["", "_found"];

        if !(_found) exitWith {};

        [] call FUNC(interaction);
    }] call CBA_fnc_addEventHandler;

    [QCLASSACE(interactMenuClosed), {
        if (!isNull GVAR(activeLogic)) then {
            [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(sleepObject_menu)]] call ACEFUNC(interact_menu,removeActionFromObject);
            deleteVehicle GVAR(activeLogic);
            GVAR(activeLogic) = objNull;
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

