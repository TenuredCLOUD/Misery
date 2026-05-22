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

[player, ["CAManBase"], 2] call EFUNC(common,nearCorpse) params ["_isNear", "_corpse"];

if (!_isNear) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoCorpse)] call CBA_fnc_localEvent;
};

private _corpseFunds = _corpse getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

private _amount = (ctrlText ((findDisplay 358492) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_corpseFunds <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoMoreFundsCorpse)] call CBA_fnc_localEvent;
};

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

if (_amount > _corpseFunds) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(Taken), [_corpseFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

    // Deduct all of corpses money
    _corpse setVariable [QGVAR(funds), _corpseFunds - _corpseFunds, true];

    // Add profits to player
    [_corpseFunds] call FUNC(modifyMoney);
};

[QEGVAR(common,tileText), format [localize LSTRING(Taken), [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;

// Deduct corpses money
_corpse setVariable [QGVAR(funds), _corpseFunds - _amount, true];

// Add profits to player
[_amount] call FUNC(modifyMoney);
