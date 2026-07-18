#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Data Parser
 * Parses trader config from CfgMisery_TradersData
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_parseData;
 *
*/

GVAR(traderData) = [];

private _traderConfig = missionConfigFile >> "CfgMisery_TradersData" >> "Traders";

{
    private _traderClass = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _shopFunds = getNumber (_x >> "shopFunds");
    private _items = [];

    {
        private _itemClass = configName _x;
        private _category = getText (_x >> "category");
        private _price = getNumber (_x >> "price");
        private _stock = getNumber (_x >> "stock");
        private _minCostFactor = getNumber (_x >> "minCostFactor");
        private _maxCostFactor = getNumber (_x >> "maxCostFactor");
        private _action = getText (_x >> "action");

        _items pushBack [_itemClass, _price, _stock, _minCostFactor, _maxCostFactor, _action, _category];
    } forEach ("true" configClasses _x);

    GVAR(traderData) pushBack [_traderClass, _displayName, _items, _shopFunds];
} forEach ("true" configClasses _traderConfig);

publicVariable QGVAR(traderData);

