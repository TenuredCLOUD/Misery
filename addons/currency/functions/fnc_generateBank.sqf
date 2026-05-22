#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generates a bank action on an object
 *
 * Arguments:
 * 0: Bank Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_generateBank;
 *
*/

params ["_object"];

private _bankAction = [
    QGVAR(accessBank),
    format [localize LSTRING(OpenAction), GVAR(bankName)],
    QPATHTOEF(markers,data\vault_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(banking_ui);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

[_object, 0, [QUOTE(ACE_MainActions)], _bankAction] call ACEFUNC(interact_menu,addActionToObject);

