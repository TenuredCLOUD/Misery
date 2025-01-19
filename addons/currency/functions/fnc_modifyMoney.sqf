#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Modifier for current player money.
 *
 * Arguments:
 * 0: Amount <NUMBER>
 * 1: Modify bank money? <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [10] call misery_currency_fnc_modifyMoney;
 * [-10] call misery_currency_fnc_modifyMoney;
 *
*/

params ["_amount", "_isBank"];

if (_isBank) exitWith {
    private _currentBankedFunds = player getVariable [QGVAR(bankedFunds), MACRO_PLAYER_DEFAULTS_LOW];
    player setVariable [QGVAR(bankedFunds), _currentBankedFunds + _amount];
};

private _currentFunds = player getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

player setVariable [QGVAR(funds), _currentFunds + _amount];
