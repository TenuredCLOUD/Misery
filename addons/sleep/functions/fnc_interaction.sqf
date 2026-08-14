#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic action to sleeping objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_sleep_fnc_interaction;
 *
*/

call FUNC(condition) params ["", "_found", "_sleepingObject", "_hitPos"];

if (_found) then {
    if (isNull GVAR(activeLogic)) then {
        GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

        GVAR(activeLogic) setPosASL _hitPos;

        private _action = [
            QGVAR(sleepObject_menu),
            localize LSTRING(Action),
            QPATHTOEF(icons,data\bed_ca.paa),
            {
                createDialog QCLASS(sleepMenu_ui);
            },
            {true},
            {},
            [],
            [0, 0, 0],
            5
        ] call ACEFUNC(interact_menu,createAction);

        [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _action] call ACEFUNC(interact_menu,addActionToObject);
    };
};

