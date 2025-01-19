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
 * [] call misery_currency_fnc_loop;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNull findDisplay 483729) exitWith {};

    private _playerFunds = player getVariable [QGVAR(currency), MACRO_PLAYER_DEFAULTS_LOW];
    private _playerFundsFormatted = [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerFundsText = format ["%3: %1 %2", GVAR(symbol), _playerFundsFormatted, profileName];

    private _playerBank = player getVariable [QGVAR(bankedCurrency), MACRO_PLAYER_DEFAULTS_LOW];
    private _playerBankFormatted = [_playerBank, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerBankText = format ["%3: %1 %2", GVAR(symbol), _playerBankFormatted, "Bank Account"];

    ctrlSetText [1000, format ["%1", GVAR(bankName)]];
    ctrlSetText [1001, _playerFundsText];
    ctrlSetText [1002, _playerBankText];
    ctrlSetText [1004, format ["%1", GVAR(symbol)]];
}, 1] call CBA_fnc_addPerFrameHandler;
