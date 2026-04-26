#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Bank UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_bankRefresh;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNull findDisplay 483729) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds", "_bankedFunds"];

    private _playerFundsParsed = _funds call BIS_fnc_parseNumber;
    private _playerFundsFormatted = [_playerFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerFundsText = format ["%3: %1 %2", GVAR(symbol), _playerFundsFormatted, profileName];

    private _playerBankParsed = _bankedFunds call BIS_fnc_parseNumber;
    private _playerBankFormatted = [_playerBankParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerBankText = format ["%3: %1 %2", GVAR(symbol), _playerBankFormatted, localize LSTRING(BankAccount)];

    ctrlSetText [1000, format ["%1", GVAR(bankName)]];
    ctrlSetText [1001, _playerFundsText];
    ctrlSetText [1002, _playerBankText];
    ctrlSetText [1004, format ["%1", GVAR(symbol)]];

    if (GVAR(bankTax)) then {
        ctrlSetText [1005, format [localize LSTRING(DepositWithdrawTax), GVAR(bankDepositTax), GVAR(bankWithdrawTax), "%"]];

        private _depositText = "";
        if (_playerFundsParsed > 0) then {
            private _depositTaxes = (GVAR(bankDepositTax) / 100);
            private _depositTaxAmount = _playerFundsParsed * _depositTaxes;
            private _taxxedFunds = _playerFundsParsed - _depositTaxAmount;
            _depositText = format [localize LSTRING(MaxDepositTax), [_taxxedFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)];
        } else {
            _depositText = localize LSTRING(NoFundsDeposit);
        };
        ctrlSetText [1006, _depositText];

        private _withdrawText = "";
        if (_playerBankParsed > 0) then {
            private _withdrawTaxes = (GVAR(bankWithdrawTax) / 100);
            private _maxWithdraw = _playerBankParsed / (1 + _withdrawTaxes); // Amount player receives after tax
            _withdrawText = format [localize LSTRING(MaxWithdrawTax), [_maxWithdraw, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)];
        } else {
            _withdrawText = localize LSTRING(NoFundsWithdraw);
        };
        ctrlSetText [1007, _withdrawText];
    } else {
        ctrlSetText [1005, localize LSTRING(NoTaxes)];
        ctrlSetText [1006, if (_playerFundsParsed > 0) then {format [localize LSTRING(MaxDeposit), [_playerFundsParsed, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]} else { localize LSTRING(NoFundsDeposit) }];
        ctrlSetText [1007, if (_playerBankParsed > 0) then {format [localize LSTRING(MaxWithdraw), [_playerBankParsed, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]} else { localize LSTRING(NoFundsWithdraw) }];
    };
}, 1] call CBA_fnc_addPerFrameHandler;
