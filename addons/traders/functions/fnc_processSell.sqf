#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Sell processor
 * Processes Selling of items + funds handling
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_processSell;
 *
 * Public: No
*/

private ['_shop','_items','_stock','_playerFunds','_selectedItem','_price','_index'];

_trader = player getVariable "currentTrader";
_shop = _trader getVariable "shop";
_items = _shop select (_shop findIf {_x select 0 isEqualTo 'Items'}) select 1;
_shopFunds = _shop select (_shop findIf {_x select 0 isEqualTo 'ShopFunds'}) select 1;
_playerFunds = player getVariable 'MiseryCurrency';
private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _currselection = lbCurSel _list;

private _selectedItem = _list lbData _currselection;

private _selectedItemData = _items select (_items findIf {_x select 0 isEqualTo _selectedItem});

private _selectedItem = _selectedItemData select 0;
private _Minprice = _selectedItemData select 3;
private _Defaultprice = _selectedItemData select 4;
private _Maxprice = _selectedItemData select 5;
_stock = _selectedItemData select 2;

private _displayName = getText (configFile >> "CfgWeapons" >> _selectedItem >> "displayName");
if (_displayName isEqualTo "") then {
    _displayName = getText (configFile >> "CfgMagazines" >> _selectedItem >> "displayName");
};
if (_displayName isEqualTo "") then {
    _displayName = getText (configFile >> "CfgVehicles" >> _selectedItem >> "displayName");
};

private _price = _Defaultprice;

 if (_stock <= 25) then {
    _markup = 1 + ((25 - _stock) / 100);
    _price = _Maxprice * _markup;
};
if (_stock > 25 && _stock <= 50) then {
    _markup = 1.01;
    _price = _Defaultprice * _markup;
};
if (_stock > 50) then {
    _price = _Minprice;
};

if (_currselection isEqualTo -1) exitWith {ctrlSetText [1001, "No sell option selected..."]; [] call FUNC(shopVAL);};

if (_shopFunds >= _price) then {
if ((_selectedItem in (items player)) or (_selectedItem in (magazines player))) then {
    player setVariable ['MiseryCurrency', _playerFunds + _price];
    _selectedItemData set [2, _stock + 1];
    _shopFunds = _shopFunds - _price;
    _shop set [(_shop findIf {_x select 0 isEqualTo "ShopFunds"}), ["ShopFunds", _shopFunds]];
    _trader setVariable ['shop', _shop, true];
    if (_selectedItem in (magazines player)) then {
        [player, _selectedItem] call CBA_fnc_removeMagazine;
    };
    if (_selectedItem in (items player)) then {
        [player, _selectedItem] call CBA_fnc_removeItem;
    };
    ctrlSetText [1001, format ["%1 Sold for %2 %3", _displayName,EGVAR(money,symbol),[_price, 1, 2, true] call CBA_fnc_formatNumber]];
    [] call FUNC(shopVAL);
}else{
    ctrlSetText [1001, "You no longer have any more of that item to sell..."];
};
}else{
    ctrlSetText [1001, "This Shop doesn't have the adequate funds to reimburse you..."];
};

