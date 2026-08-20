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

private _targetUID = ACE_player getVariable [QGVAR(giftRecipient), ""];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

private _recipient = _targetUID call BIS_fnc_getUnitByUID;

if (isNull _recipient) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoPlayer)] call CBA_fnc_localEvent;
};

private _recipientFunds = _recipient getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

private _amount = (ctrlText ((findDisplay 358493) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

if (_amount > _funds) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NotEnoughGift)] call CBA_fnc_localEvent;
};

[QEGVAR(common,tileText), format [localize LSTRING(Gifted), [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

// Increase target players money
_recipient setVariable [QGVAR(funds), _recipientFunds + _amount, true];

// Remove funds from player gifting
[-_amount] call FUNC(modifyMoney);
