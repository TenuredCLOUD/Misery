#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Modifier for current player money.
 *
 * Arguments:
 * 0: Amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * Examples:
 * [10] call misery_currency_fnc_modifyMoney;
 * [-10] call misery_currency_fnc_modifyMoney;
 *
*/

params ["_amount"];

private _currentFunds = player getVariable [QGVAR(currency), MACRO_PLAYER_DEFAULTS_LOW];

player setVariable [QGVAR(currency), _currentFunds + _amount];
