#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop icons
 * Processes Lists of Icons as well as text but in the icon controls
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_processIcon;
 *
*/

[{!isNull findDisplay 982390}, {

    private _dialog = findDisplay 982390;
    private _list = _dialog displayCtrl 1500;
    private _iconCtrl = _dialog displayCtrl 1200;
    private _iconTxt = _dialog displayCtrl 1004;
    private _currselection = lbCurSel _list;

    if (_currselection isEqualTo -1) exitWith {
        _iconCtrl ctrlSetText "";
        _iconTxt ctrlSetText "";
    };

    private _selectedItem = _list lbData _currselection;

    private _trader = player getVariable [QGVAR(currentTrader), objNull];
    private _shop = _trader getVariable [QGVAR(shop), []];
    _shop params ["", "", "_items"];

    private _itemIndex = _items findIf {(_x select 0) isEqualTo _selectedItem};
    private _priceStr = "";
    private _stockStr = "";

    if (_itemIndex != -1) then {
        (_items select _itemIndex) params ["_itemName", "_basePrice", "_stock", "_minCostFactor", "_maxCostFactor"];

        private _isBuy = GVAR(currentAction) isEqualTo "buy";
        private _price = [_basePrice, _stock, _minCostFactor, _maxCostFactor, _isBuy] call FUNC(calculatePrice);
        _priceStr = format ["Price: %1 %2", EGVAR(currency,symbol), [_price, 1, 2, true] call CBA_fnc_formatNumber];

        if (_isBuy) then {
            _stockStr = format ["Stock: %1", round(_stock)];
        } else {
            _stockStr = format ["Inventory: %1", [_itemName] call EFUNC(common,countItem)];
        };
    };

    if ([_selectedItem, "CfgVehicles"] call EFUNC(common,configCheck)) then {
        [_selectedItem] call EFUNC(common,getObjectData) params ["_objectDisplayName", "_objectPicture"];
        _iconCtrl ctrlSetText _objectPicture;

        private _parsedObjectPrice = parseText _priceStr;
        private _parsedObjectStock = parseText _stockStr;

        _iconTxt ctrlSetStructuredText composeText [_objectDisplayName, lineBreak, _parsedObjectPrice, lineBreak, _parsedObjectStock];
    } else {
        [_selectedItem] call EFUNC(common,getItemData) params ["_itemsDisplayName", "_itemPicture", "_itemDescription"];
        _iconCtrl ctrlSetText _itemPicture;

        private _parsedItemPrice = parseText _priceStr;
        private _parsedItemStock = parseText _stockStr;
        private _parsedDescription = parseText _itemDescription;

        _iconTxt ctrlSetStructuredText composeText [_itemsDisplayName, lineBreak, _parsedDescription, lineBreak, _parsedItemPrice, lineBreak, _parsedItemStock];
    };
}, []] call CBA_fnc_waitUntilAndExecute;
