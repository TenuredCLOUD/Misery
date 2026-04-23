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

private _traderAction = [
    QGVAR(accessTrader),
    format ["Open %1", _shopName],
    QPATHTOEF(markers,data\hand_coins_ca.paa),
    {
        params ["_target", "_player"];
        _player setVariable [QGVAR(currentTrader), _target];
        createDialog QCLASS(traderShop_ui);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ace_interact_menu_fnc_createAction;

[_trader, 0, ["ACE_MainActions"], _traderAction] call ace_interact_menu_fnc_addActionToObject;

GVAR(activeTraders) pushBackUnique _trader;
publicVariable QGVAR(activeTraders);
