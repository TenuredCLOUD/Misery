#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Claim Support (Phoenix fund) Processor
 * Also adds a 24 hour cooldown before requesting more funds
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_claim;
 *
*/

// ToDo

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _maxAmount = MiseryCurrency_PhoenixAccount * 0.01;
private _lastWithdrawalTime = player getVariable [QGVAR(lastBankLoan), MACRO_PLAYER_DEFAULTS_LOW];

if (time > _lastWithdrawalTime + 4 * 60 * 60) then {
    if (_amount > 0 && _amount <= _maxAmount && _amount <= MiseryCurrency_PhoenixAccount) then {
        player setVariable [QGVAR(currency), (player getVariable [QGVAR(currency), MACRO_PLAYER_DEFAULTS_LOW]) + _amount];
        MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount - _amount;
        publicVariable "MiseryCurrency_PhoenixAccount";
        player setVariable [QGVAR(lastBankLoan), time];
    };
};
