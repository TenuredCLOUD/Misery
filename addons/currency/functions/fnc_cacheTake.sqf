#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Cache UI Take
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_cacheTake;
 *
*/

private _cache = ACE_player getVariable [QGVAR(currentCache), objNull];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

private _cacheFunds = _cache getVariable [QGVAR(cacheFunds), 0];

private _amount = (ctrlText ((findDisplay 483730) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

if (_amount > _cacheFunds) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

[_amount] call FUNC(modifyMoney);

_cache setVariable [QGVAR(cacheFunds), _cacheFunds - _amount, true];

[QEGVAR(common,tileText), format [localize LSTRING(Taken), [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;
