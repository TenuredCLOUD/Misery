#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Deposit Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_deposit;
 *
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable QCLASS(currency);
    if (_amount <= _playerFunds) then {
        player setVariable [QCLASS(currency), _playerFunds - _amount];
        player setVariable [QCLASS(bankedCurrency), (player getVariable QCLASS(bankedCurrency)) + _amount];
    };

