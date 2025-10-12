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

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds", "_bankedFunds"];

if (_isBank) exitWith {
    player setVariable [QGVAR(bankedFunds), _bankedFunds + _amount];
};

player setVariable [QGVAR(funds), _funds + _amount];
