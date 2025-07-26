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
    _trader setVariable [QGVAR(isBusy), false, true];
};

GVAR(currentAction) = nil;
player setVariable [QGVAR(currentTrader), nil];
