#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Shop Generator
 * Initializes trader with config-based shop data and sets up hold action
 *
 * Arguments:
 * 0: Trader object <OBJECT>
 * 1: Trader class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_generateShop;
 *
*/

params ["_trader", "_traderClass"];

if (isNull _trader) exitWith {};

private _traderData = [] call FUNC(getTraderData);
private _shop = _traderData select {(_x select 0) isEqualTo _traderClass} select 0;

if (isNil "_shop") exitWith {};

_shop params ["_traderClass", "_shopName", "_items", "_shopFunds"];

_trader setVariable [QGVAR(shop), _shop, true];
_trader setVariable [QGVAR(isBusy), false, true];

// Add hold action
[
    _trader,
    format ["Open %1", _shopName],
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa),
    QUOTE(_this distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isBusy)),false)])),
    QUOTE(_caller distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isBusy)),false)])),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _caller setVariable [QGVAR(currentTrader), _target];
        createDialog QCLASS(traderShop_ui);
    },
    {},
    [_shopName, _trader],
    1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;

GVAR(activeTraders) pushBackUnique _trader;
publicVariable QGVAR(activeTraders);
