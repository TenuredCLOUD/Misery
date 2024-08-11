/*
Misery Bank Generater
Passes arguments to generate a banker / bank object
Designed specifically for Misery mod
by TenuredCLOUD

// Generate a bank
[trader1] call Misery_fnc_GenerateBank;
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
