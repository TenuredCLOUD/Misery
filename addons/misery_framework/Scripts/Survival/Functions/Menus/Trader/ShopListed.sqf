/* -----------------------------------
Misery Trader Shop UI List populater
Defines Traders purchase options, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {sleep 0.01; !isNull findDisplay 982390};

if (!isNull findDisplay 982390) exitWith { 
    private ["_dialog","_list","_PurchaseB","_itemName","_price","_stock","_index"];

    _dialog = findDisplay 982390; 
    _PurchaseB = _dialog displayCtrl 1600;
    
    _list = findDisplay 982390 displayCtrl 1500; 

    // Fetch the trader from the player
    _trader = player getVariable "currentTrader";

    // Fetch the shop data from the trader
    _shop = _trader getVariable "shop";

    // Fetch the shop name
    _shopName = _shop select (_shop findIf {_x select 0 == "ShopName"}) select 1;

    // Set the shop name
    ctrlSetText [1000, _shopName];

    // Fetch the items
    _items = _shop select (_shop findIf {_x select 0 == "Items"}) select 1;

    // Fetch the stock
    _stock = _shop select (_shop findIf {_x select 0 == "Stock"}) select 1;

    // Fetch the prices
    _prices = _shop select (_shop findIf {_x select 0 == "Price"}) select 1;

    lbClear _list;

    {
    _itemName = _x;
    _price = _prices select _forEachIndex;
    _stock = _stock select _forEachIndex;
    private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");  
    if (_displayName == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");  
    };
    _index = _list lbAdd format ["%1 - Price: %2 - Stock: %3", _displayName, _price, _stock];
    _list lbSetData [_index, _itemName];
    private _picture = getText (configFile >> "CfgWeapons" >> _itemName >> "picture");
    if (_picture == "") then {
        _picture = getText (configFile >> "CfgMagazines" >> _itemName >> "picture");
    };
    _list lbSetPicture [_index, _picture];
} forEach _items;

if (lbSize _list == 0) then {
    _PurchaseB ctrlShow false;
} else {
    _PurchaseB ctrlShow true;
};
    };

