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

[
    _object,
    format ["Open %1", GVAR(bankName)],
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(_this distance _target < 3),
    QUOTE(_caller distance _target < 3),
    {},
    {},
    {
        createDialog QCLASS(banking_ui);
    },
    {},
    [],
    1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;

