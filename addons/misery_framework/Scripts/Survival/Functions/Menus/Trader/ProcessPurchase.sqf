/*
Misery Trader Shop Purchase processor
Processes Buying of items + funds handling
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ['_shop','_items','_stock','_playerFunds','_selectedItem','_price','_index'];

_trader = player getVariable "currentTrader";
_shop = _trader getVariable "shop";
_items = _shop select (_shop findIf {_x select 0 == 'Items'}) select 1;
_shopFunds = _shop select (_shop findIf {_x select 0 == 'ShopFunds'}) select 1;
_playerFunds = player getVariable 'MiseryCurrency';
private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _currselection = lbCurSel _list;

private _selectedItem = _list lbData _currselection;

private _selectedItemData = _items select (_items findIf {_x select 0 == _selectedItem});

private _selectedItem = _selectedItemData select 0;
private _Minprice = _selectedItemData select 3;
private _Defaultprice = _selectedItemData select 4;
private _Maxprice = _selectedItemData select 5;
_stock = _selectedItemData select 2;

private _displayName = getText (configFile >> "CfgWeapons" >> _selectedItem >> "displayName");  
if (_displayName == "") then {
    _displayName = getText (configFile >> "CfgMagazines" >> _selectedItem >> "displayName");  
};
if (_displayName == "") then {  
    _displayName = getText (configFile >> "CfgVehicles" >> _selectedItem >> "displayName");   
};

private _price = _Defaultprice;

if (_stock <= 25) then {
    _markup = 1 + ((25 - _stock) / 100);
    _price = _Maxprice * ((_markup) * _markup);
};
if (_stock > 25 && _stock <= 50) then {
    _markup = 1.01;
    _price = _Defaultprice * ((_markup) * _markup);
};
if (_stock > 50) then {
    _markup = 1.01;
    _price = _Minprice * _markup;
};

_codeToExecute = _selectedItemData select 6;

if (_playerFunds >= _price) then {
    if (_stock < 1) exitWith {ctrlSetText [1001, format ["There isn't enough stock to purchase %1...",_displayName]]; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';};
    player setVariable ['MiseryCurrency', _playerFunds - _price];
    _selectedItemData set [2, _stock - 1];
    _shopFunds = _shopFunds + _price;
    _shop set [(_shop findIf {_x select 0 == "ShopFunds"}), ["ShopFunds", _shopFunds]];
    _trader setVariable ['shop', _shop, true];
    if (!isNil "_codeToExecute") then {
        call _codeToExecute;
    } else {
        [player, _selectedItem, true] call CBA_fnc_addItem;
        ctrlSetText [1001, format ["%1 Purchased for %2 %3",_displayName,MiseryCurrencySymbol,[_price, 1, 2, true] call CBA_fnc_formatNumber]];	
    };
    [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';
} else {
    ctrlSetText [1001, "You cannot afford this!"];	
};


