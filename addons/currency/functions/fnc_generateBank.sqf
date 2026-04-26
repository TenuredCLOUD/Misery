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

// [
//     _object,
//     format ["Open %1", GVAR(bankName)],
//     QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
//     QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
//     QUOTE(_this distance _target < 3),
//     QUOTE(_caller distance _target < 3),
//     {},
//     {},
//     {
//         createDialog QCLASS(banking_ui);
//     },
//     {},
//     [],
//     1,
//     nil,
//     false,
//     false
// ] call BIS_fnc_holdActionAdd;

private _bankAction = [
    QGVAR(accessBank),
    format ["Open %1", GVAR(bankName)],
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

