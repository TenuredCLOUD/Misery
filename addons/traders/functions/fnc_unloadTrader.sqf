#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Unload trader / remove values
 * Remove trader variables from leaving trading UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_unloadTrader;
 *
*/

private _trader = player getVariable [QGVAR(currentTrader), objNull];

if (!isNull _trader) then {
    _trader setVariable [QGVAR(traderIsBusy), false, true];
    _trader setVariable [QGVAR(tradingWith), nil, true];
    private _queue = _trader getVariable [QGVAR(tradingQue), []];
    private _index = _queue find (getPlayerUID player);

    if (_index isNotEqualTo -1) then {
        _queue deleteAt _index;
        _trader setVariable [QGVAR(tradingQue), _queue, true];
    };
};

GVAR(currentAction) = nil;
player setVariable [QGVAR(currentTrader), nil];
