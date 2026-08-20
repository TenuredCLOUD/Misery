#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take Money UI Action process
 * Processes money taking from corpses
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_takeMoney;
 *
*/

private _target = ACE_player getVariable [QGVAR(searchTarget), objNull];

if (isNull _target) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoCorpse)] call CBA_fnc_localEvent;
};

private _targetFunds = _target getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

private _amount = (ctrlText ((findDisplay 358492) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_targetFunds <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoMoreFundsCorpse)] call CBA_fnc_localEvent;
};

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

if (_amount > _targetFunds) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(Taken), [_targetFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

    // Deduct all of corpses money
    _target setVariable [QGVAR(funds), _targetFunds - _targetFunds, true];

    // Add profits to player
    [_targetFunds] call FUNC(modifyMoney);
};

[QEGVAR(common,tileText), format [localize LSTRING(Taken), [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

// Deduct corpses money
_target setVariable [QGVAR(funds), _targetFunds - _amount, true];

// Add profits to player
[_amount] call FUNC(modifyMoney);
