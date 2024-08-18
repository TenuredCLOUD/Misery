#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank Generater
 * Passes arguments to generate a banker / bank object
 *
 * Arguments:
 * 0: Object you want to have a bank interaction with <OBJECT>
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [trader1] call misery_bank_fnc_generate;
 *
*/

params ["_traderName"];

if (isNil "Misery_BankName") then {Misery_BankName = "New World Bank"};

[
    _traderName,
    format ["Open %1", Misery_BankName],
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "_this distance _target < 3",
    "_caller distance _target < 3",
    {},
    {},
    {
    params ["_target", "_caller", "_actionId", "_arguments"];
    createDialog "Misery_Banking_UI";
    },
    {},
    [_traderName],
    0.1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;
