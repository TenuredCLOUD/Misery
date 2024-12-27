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

    private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
    private _maxAmount = MiseryCurrency_PhoenixAccount * 0.01;
    private _lastWithdrawalTime = player getVariable [QCLASS(lastBankLoan), 0];

    if (time > _lastWithdrawalTime + 4 * 60 * 60) then {
        if (_amount > 0 && _amount <= _maxAmount && _amount <= MiseryCurrency_PhoenixAccount) then {
            player setVariable [QCLASS(currency), (player getVariable QCLASS(currency)) + _amount];
            MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount - _amount;
            publicVariable "MiseryCurrency_PhoenixAccount";
            player setVariable [QCLASS(lastBankLoan), time];
        };
    };



