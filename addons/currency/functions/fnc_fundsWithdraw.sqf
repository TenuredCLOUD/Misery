#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Bank UI Withdraw Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_fundsWithdraw;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "_bankedFunds"];

private _amount = (ctrlText ((findDisplay 483729) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), "Invalid withdrawal amount..."] call CBA_fnc_localEvent;
};

private _taxAmount = 0;
private _totalDeduction = _amount;

if (GVAR(bankTax)) then {
    private _taxes = (GVAR(bankWithdrawTax) / 100);
    _taxAmount = _amount * _taxes;
    _totalDeduction = _amount + _taxAmount;
};

if (_totalDeduction > _bankedFunds) exitWith {
    [QEGVAR(common,tileText), "You don't have enough funds for this withdrawal..."] call CBA_fnc_localEvent;
};

// Add full amount to cash
[_amount] call FUNC(modifyMoney);

// Deduct amount + tax (or full amount if no tax) from bank
[-_totalDeduction, true] call FUNC(modifyMoney);

private _message = if (_taxAmount > 0) then {
    format ["Withdrew: %2 %1 (Tax: %2 %3)", [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol), [_taxAmount, 1, 2, true] call CBA_fnc_formatNumber]
} else {
    format ["Withdrew: %2 %1", [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]
};

[QEGVAR(common,tileText), _message] call CBA_fnc_localEvent;
