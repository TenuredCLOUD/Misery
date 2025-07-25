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
 * 0: Array of Variables <ARRAY>|
 *    0: Trader class <STRING>
 *    1: Display name <STRING>
 *    2: Items <ARRAY>
 *    3: Shop funds <NUMBER>
 *
 * Example:
 * [] call misery_traders_fnc_getTraderData;
 *
*/

private _traderData = [];
private _traderConfig = missionConfigFile >> "CfgMisery_TradersData" >> "Traders";

if (isNull _traderConfig) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_TradersData not found in mission config"] call EFUNC(common,debugMessage);
    _traderData
};

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

    _traderData pushBack [_traderClass, _displayName, _items, _shopFunds];
} forEach ("true" configClasses _traderConfig);

_traderData
