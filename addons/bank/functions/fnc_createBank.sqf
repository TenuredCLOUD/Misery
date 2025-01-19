#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Creates a bank on an object.
 *
 * Arguments:
 * 0: Bank Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [trader1] call misery_bank_fnc_createBank;
 *
*/

params ["_traderName"];

[
    _traderName,
    format ["Open %1", GVAR(bankName)],
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "_this distance _target < 3",
    "_caller distance _target < 3",
    {},
    {},
    {
        createDialog QCLASS(banking_ui);
    },
    {},
    [],
    0.1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;
