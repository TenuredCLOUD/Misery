#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Cache UI Store
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_cacheStore;
 *
*/

private _cache = ACE_player getVariable [QGVAR(currentCache), objNull];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

private _cacheFunds = _cache getVariable [QGVAR(cacheFunds), 0];

private _amount = (ctrlText ((findDisplay 483730) displayCtrl 1400)) call BIS_fnc_parseNumber;

if (_amount <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(InvalidAmount)] call CBA_fnc_localEvent;
};

if (_amount > _funds) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NotEnoughDeposit)] call CBA_fnc_localEvent;
};

[-_amount] call FUNC(modifyMoney);

_cache setVariable [QGVAR(cacheFunds), _cacheFunds + _amount, true];

[QEGVAR(common,tileText), format [localize LSTRING(MoneyStored), [_amount, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;
