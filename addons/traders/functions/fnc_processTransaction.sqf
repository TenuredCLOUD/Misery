#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Transaction Processor
 * Processes buying, selling, or gifting items
 *
 * Arguments:
 * 0: Action <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Buy"] call misery_traders_fnc_processTransaction;
 *
 * Public: No
*/

params ["_buttonAction"];

private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _currSelection = lbCurSel _list;
private _trader = player getVariable [QGVAR(currentTrader), objNull];
private _shop = _trader getVariable [QGVAR(shop), []];
private _items = _shop select 2;
private _shopFunds = _shop select 3;
private _selectedItem = _list lbData _currSelection;
private _itemIndex = _items findIf {(_x select 0) isEqualTo _selectedItem};
private _itemData = _items select _itemIndex;
private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
private _playerFunds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

if (isNull _dialog) exitWith {};

if (_currSelection < 0) exitWith {
    ctrlSetText [1001, "No item selected..."];
};

if (isNull _trader) exitWith {(findDisplay 982390) closeDisplay 2};

if (_shop isEqualTo []) exitWith {(findDisplay 982390) closeDisplay 2};

if (_itemIndex < 0) exitWith {(findDisplay 982390) closeDisplay 2};

_itemData params ["_itemName", "_basePrice", "_stock", "_minCostFactor", "_maxCostFactor", "_purchaseCode", "_category"];
private _buyPrice = [_basePrice, _itemData select 2, _minCostFactor, _maxCostFactor, true] call FUNC(calculatePrice);
private _sellPrice = [_basePrice, _itemData select 2, _minCostFactor, _maxCostFactor, false] call FUNC(calculatePrice);

if (_displayName isEqualTo "") then {
    _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
};
if (_displayName isEqualTo "") then {
    _displayName = getText (configFile >> "CfgVehicles" >> _itemName >> "displayName");
};
if (_displayName isEqualTo "") then {
    _displayName = _itemName;
};

switch (true) do {
    case (_buttonAction isEqualTo "Buy"): {
        if (_playerFunds < _buyPrice) exitWith {
            ctrlSetText [1001, "You cannot afford this!"];
        };
        if (_stock isEqualTo 0) exitWith {
            ctrlSetText [1001, format ["Out of stock: %1", _displayName]];
        };
        if (_shopFunds < _buyPrice) exitWith {
            ctrlSetText [1001, "Trader cannot afford this transaction!"];
        };
        _itemData set [2, _stock - 1];
        _trader setVariable [QGVAR(shop), _shop, true];
        player setVariable [QEGVAR(currency,funds), _playerFunds - _buyPrice, true];
        _shop set [3, _shopFunds + _buyPrice];
        _trader setVariable [QGVAR(shop), _shop, true];
        if (_purchaseCode isNotEqualTo "") then {
            call compile _purchaseCode;
        } else {
            private _added = [player, _itemName, true] call CBA_fnc_addItem;

        };
        ctrlSetText [1001, format ["%1 purchased for %2 %3", _displayName, EGVAR(currency,symbol), [_buyPrice, 1, 2, true] call CBA_fnc_formatNumber]];
        [] call FUNC(updateShop);
    };
    case (_buttonAction isEqualTo "Sell"): {
        if ([_itemName] call EFUNC(common,countItem) isEqualTo 0) exitWith {
            ctrlSetText [1001, "You don't have this item..."];
        };
        if (_shopFunds < _sellPrice) exitWith {
            ctrlSetText [1001, "Trader cannot afford this transaction!"];
        };
        _itemData set [2, _stock + 1];
        _trader setVariable [QGVAR(shop), _shop, true];
        player setVariable [QEGVAR(currency,funds), _playerFunds + _sellPrice, true];
        _shop set [3, _shopFunds - _sellPrice];
        _trader setVariable [QGVAR(shop), _shop, true];
        if (_itemName in magazines player) then {
            [player, _itemName] call CBA_fnc_removeMagazine;
        } else {
            [player, _itemName] call CBA_fnc_removeItem;
        };
        ctrlSetText [1001, format ["%1 sold for %2 %3", _displayName, EGVAR(currency,symbol), [_sellPrice, 1, 2, true] call CBA_fnc_formatNumber]];
        [] call FUNC(updateShop);
    };
    case (_buttonAction isEqualTo "Gift Item"): {
        if (_trader getVariable [QGVAR(giftClicked), false]) then {
            if ([_itemName] call EFUNC(common,countItem) isEqualTo 0) exitWith {
                ctrlSetText [1001, "You don't have this item..."];
            };
            _itemData set [2, _stock + 1];
            _trader setVariable [QGVAR(shop), _shop, true];
            if (_itemName in magazines player) then {
                [player, _itemName] call CBA_fnc_removeMagazine;
            } else {
                [player, _itemName] call CBA_fnc_removeItem;
            };
            ctrlSetText [1001, format ["Successfully gifted %1", _displayName]];
            _trader setVariable [QGVAR(giftClicked), false];
        } else {
            _trader setVariable [QGVAR(giftClicked), true];
            ctrlSetText [1001, format ["Confirm gift of %1?", _displayName]];
            [{
                params ["_trader"];
                if (isNull _trader) exitWith {};
                _trader setVariable [QGVAR(giftClicked), false];
                if (!isNull findDisplay 982390) then {
                    ctrlSetText [1001, ""];
                };
            }, [_trader], 5] call CBA_fnc_waitAndExecute;
        };
        [] call FUNC(updateShop);
    };
    default {
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid action: %1", _buttonAction]] call EFUNC(common,debugMessage);
        [] call FUNC(updateShop);
    };
};
