#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Contribute (Phoenix fund) Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_contribute;
 *
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable QCLASS(currency);
    if (_amount <= _playerFunds) then {
        player setVariable [QCLASS(currency), _playerFunds - _amount];
        MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount + _amount;
        publicVariable "MiseryCurrency_PhoenixAccount";
    };

