#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Bank UI Deposit Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_fundsDeposit;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

private _amount = (ctrlText ((findDisplay 483729) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), "Invalid deposit amount..."] call CBA_fnc_localEvent;
};

if (_amount > _funds) exitWith {
    [QEGVAR(common,tileText), "You don't have enough funds for this deposit..."] call CBA_fnc_localEvent;
};

private _taxAmount = 0;
private _taxxedFunds = _amount;

if (GVAR(bankTax)) then {
    private _taxes = (GVAR(bankDepositTax) / 100);
    _taxAmount = _amount * _taxes;
    _taxxedFunds = _amount - _taxAmount;
};

// Deduct full amount from cash
[-_amount] call FUNC(modifyMoney);

// Add taxed amount (or full amount if no tax) to bank
[_taxxedFunds, true] call FUNC(modifyMoney);

private _message = if (_taxAmount > 0) then {
    format ["Deposited: %2 %1 (Tax: %2 %3)", [_taxxedFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol), [_taxAmount, 1, 2, true] call CBA_fnc_formatNumber]
} else {
    format ["Deposited: %2 %1", [_taxxedFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]
};

[QEGVAR(common,tileText), _message] call CBA_fnc_localEvent;
