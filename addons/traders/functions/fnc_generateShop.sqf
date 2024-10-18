#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Shop Generater
 * Takes shop data and stores Hashmap on trader AI
 * Also passes data to server side
 *
 * Arguments:
 * 0: Hashmap data <ARRAY>
 * 1: Trader object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _shop = [
 *   ["ShopName", "General Goods"],
 *   ["Items", ["Classname_1", "Classname_2"]],
 *   ["Stock", [50, 5, 10]],
 *   ["Price", [5000,1000, 100]],
 * ];
 *
 * [_shop, trader1] call misery_traders_fnc_generateShop;
 *
 * Public: No
*/

params ["_shopData", "_traderName"];

// Fetch the shop data from the trader
_shop = _traderName getVariable "shop";

// Check if the shop data exists
if (isNil "_shop") then {
    _traderName setVariable ["shop", _shopData, true];
};

// Fetch the shop data from the trader
_shop = _traderName getVariable "shop"; //refetch data if shop was Nil

// Fetch the shop name
_shopName = _shop select (_shop findIf {_x select 0 == "ShopName"}) select 1;

[
    _traderName,
    format ["Open %1", _shopName],
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
    "_this distance _target < 3",
    "_caller distance _target < 3",
    {},
    {},
    {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller setVariable ["currentTrader", _target];
    _queue = _target getVariable "Misery_TradingQue";
    if (isNil "_queue") then {
        _queue = [];
        _target setVariable ["Misery_TradingQue", _queue, true];
    };
    if (_target getVariable "Misery_TraderIsBusy" isEqualTo true) exitWith {
        _queue pushBack (getPlayerUID _caller);
        _target setVariable ["Misery_TradingQue", _queue, true];
        createDialog "Misery_TraderShop_WaitQue_UI";
    };
    _queue pushBack (getPlayerUID _caller);
    _target setVariable ["Misery_TradingQue", _queue, true];
    createDialog "Misery_TraderShop_Buy_GUI";
    },
    {},
    [_shopName, _traderName],
    0.1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;

MiseryActiveTraders pushBack _traderName;

publicVariable "MiseryActiveTraders";
