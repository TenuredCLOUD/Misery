#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Load trader / set values
 * Initialize trader variables in trading UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_loadTrader;
 *
*/

private _trader = player getVariable [QGVAR(currentTrader), objNull];

if (isNull _trader) exitWith {(findDisplay 982390) closeDisplay 2};

_trader setVariable [QGVAR(traderIsBusy), true, true];
_trader setVariable [QGVAR(tradingWith), profileName, true];

GVAR(currentAction) = "buy";

[] call FUNC(processCategory);
[] call FUNC(updateShop);
