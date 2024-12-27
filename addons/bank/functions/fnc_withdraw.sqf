#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Withdraw Processor
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_withdraw;
 *
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerBank = player getVariable QCLASS(bankedCurrency);
    if (_amount <= _playerBank) then {
        player setVariable [QCLASS(bankedCurrency), _playerBank - _amount];
        player setVariable [QCLASS(currency), (player getVariable QCLASS(currency)) + _amount];
    };

