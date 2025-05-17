#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Leave Que
 * Removes player & Updates position in the trader queue
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_leaveQue;
 *
*/

private _trader = player getVariable [QGVAR(currentTrader), objNull];

if (!isNull _trader) then {
    private _queue = _trader getVariable [QGVAR(tradingQue), []];
    private _index = _queue find (getPlayerUID player);
    if (_index isNotEqualTo -1) then {
        _queue deleteAt _index;
        _trader setVariable [QGVAR(tradingQue), _queue, true];
    };
};
