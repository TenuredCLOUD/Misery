#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Give Money UI Action process
 * Processes money gifting to players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_giveMoney;
 *
*/

[player, 2] call EFUNC(common,nearPlayer) params ["_isNear", "_targetPlayer"];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

if (!_isNear) exitWith {
    [QEGVAR(common,tileText), "No player nearby..."] call CBA_fnc_localEvent;
};

private _targetPlayerFunds = _targetPlayer getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

private _amount = (ctrlText ((findDisplay 358493) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), "Invalid amount..."] call CBA_fnc_localEvent;
};

if (_amount > _funds) exitWith {
    [QEGVAR(common,tileText), "You don't have enough funds to gift this much..."] call CBA_fnc_localEvent;
};

[QEGVAR(common,tileText), format ["Money gifted: %2 %1", [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

// Increase target players money
_targetPlayer setVariable [QGVAR(funds), _targetPlayerFunds + _amount, true];

// Remove funds from player gifting
[-_amount] call FUNC(modifyMoney);
