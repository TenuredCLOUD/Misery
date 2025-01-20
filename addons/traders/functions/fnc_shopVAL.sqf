#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop watchdog
 * Watches shop values and process deductions + increases in funds, as well as overall shop processing...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_shopVAL;
 *
 * Public: No
*/

[{!isNull findDisplay 982390},
{
        private _dialog = findDisplay 982390;
        private _list = _dialog displayCtrl 1500;
        private _categoryDropdown = _dialog displayCtrl 2100;
        private _currselection = lbCurSel _list;
        private _currselectionCat = lbCurSel _categoryDropdown;
        private _selectedItem = _list lbData _currselection;
        private _selectedCategory = _categoryDropdown lbData _currselectionCat;
        private _IconCtrl = _dialog displayCtrl 1200;
        private _IconTxt = _dialog displayCtrl 1004;

        private _buySellButton = _dialog displayCtrl 1602;
        private _giftButton = _dialog displayCtrl 1603;

        private _checkbox = _dialog displayCtrl 2800;

        private _pweapon = primaryWeapon player;
        private _hweapon = handgunWeapon player;
        private _sweapon = secondaryWeapon player;
        private _compatibleItemsP = [];
        private _compatibleMagazinesP = [];
        private _compatibleItemsH = [];
        private _compatibleMagazinesH = [];
        private _compatibleItemsS = [];
        private _compatibleMagazinesS = [];

        if (_pweapon isNotEqualTo "") then {
        _compatibleItemsP = [_pweapon] call CBA_fnc_compatibleItems;
        _compatibleMagazinesP = [_pweapon] call CBA_fnc_compatibleMagazines;
        };

        if (_hweapon isNotEqualTo "") then {
        _compatibleItemsH = [_hweapon] call CBA_fnc_compatibleItems;
        _compatibleMagazinesH = [_hweapon] call CBA_fnc_compatibleMagazines;
        };

        if (_sweapon isNotEqualTo "") then {
        _compatibleItemsS = [_sweapon] call CBA_fnc_compatibleItems;
        _compatibleMagazinesS = [_sweapon] call CBA_fnc_compatibleMagazines;
        };

        _trader = player getVariable "currentTrader";

        _shop = _trader getVariable "shop";

        _shopName = _shop select (_shop findIf {_x select 0 isEqualTo "ShopName"}) select 1;

        ctrlSetText [1000, _shopName];

        //Refresh notifier
        ctrlSetText [1001, nil];

        _items = _shop select (_shop findIf {_x select 0 isEqualTo "Items"}) select 1;

        _inventoryItems = items player;
        _inventoryMagazines = magazines player;
        _inventory = _inventoryItems + _inventoryMagazines;

        lbClear _list;

        if (currentAction isEqualTo "buy") then {
        {
        _itemData = _x;
        _itemName = _itemData select 0;
        _category = _itemData select 1;
        _stock = _itemData select 2;
        _Minprice = _itemData select 3;
        _Defaultprice = _itemData select 4;
        _Maxprice = _itemData select 5;

        private _price = _Defaultprice;

        if (_stock <= 25) then {
            _markup = 1 + ((25 - _stock) / 100);
            _price = _Maxprice * (_markup^2);
        };
        if (_stock > 25 && _stock <= 50) then {
            _markup = 1.01;
            _price = _Defaultprice * (_markup^2);
        };
        if (_stock > 50) then {
            _markup = 1.01;
            _price = _Minprice * _markup;
        };

        _ItemCostDiff = ((_price / _Defaultprice) * 100) - 100;

        if (_category isEqualTo _selectedCategory) then {
        if (cbChecked _checkbox) then {
        if (_itemName in _compatibleItemsP || _itemName in _compatibleMagazinesP || _itemName in _compatibleItemsH || _itemName in _compatibleMagazinesH || _itemName in _compatibleItemsS || _itemName in _compatibleMagazinesS) then {
            private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
            };
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgVehicles" >> _itemName >> "displayName");
            };
            _index = _list lbAdd format ["%1 - Price: %2 - Stock: %3", _displayName, [_price, 1, 2, true] call CBA_fnc_formatNumber, round(_stock)];
            _list lbSetData [_index, _itemName];
            private _picture = getText (configFile >> "CfgWeapons" >> _itemName >> "picture");
            if (_picture isEqualTo "") then {
                _picture = getText (configFile >> "CfgMagazines" >> _itemName >> "picture");
            };
            _list lbSetPicture [_index, _picture];
            };
        } else {
            private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
            };
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgVehicles" >> _itemName >> "displayName");
            };
            _index = _list lbAdd format ["%1 - Price: %2 - Stock: %3", _displayName, [_price, 1, 2, true] call CBA_fnc_formatNumber, round(_stock)];
            _list lbSetData [_index, _itemName];
            private _picture = getText (configFile >> "CfgWeapons" >> _itemName >> "picture");
            if (_picture isEqualTo "") then {
                _picture = getText (configFile >> "CfgMagazines" >> _itemName >> "picture");
            };
            _list lbSetPicture [_index, _picture];
        };
    };

    } forEach _items;

    _buySellButton ctrlSetText "Buy";

    _giftButton ctrlShow false;

    _checkbox ctrlShow true;

    if (lbSize _list > 0) then {
        _buySellButton ctrlEnable true;
    } else {
        _buySellButton ctrlEnable false;
    };
    }else{
    if (currentAction isEqualTo "sell") then {
    {
        _itemData = _x;
        _itemName = _itemData select 0;
        _category = _itemData select 1;
        _stock = _itemData select 2;
        _Minprice = _itemData select 3;
        _Defaultprice = _itemData select 4;
        _Maxprice = _itemData select 5;

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

        _ItemCostDiff = ((_price / _Defaultprice) * 100) - 100;

        private _playerInventory = uniformItems player + vestItems player + backpackItems player;

        private _playerItemCount = 0;
        {
        if (_x isEqualTo _itemName) then {
        _playerItemCount = _playerItemCount + 1;
        };
        } forEach _playerInventory;

        if (_playerItemCount > 0 && _category isEqualTo _selectedCategory) then {
            private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
            if (_displayName isEqualTo "") then {
                _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
            };
            _index = _list lbAdd format ["%1 - Price: %2 - Inventory: %3", _displayName, [_price, 1, 2, true] call CBA_fnc_formatNumber, _playerItemCount];
            _list lbSetData [_index, _itemName];
            private _picture = getText (configFile >> "CfgWeapons" >> _itemName >> "picture");
            if (_picture isEqualTo "") then {
                _picture = getText (configFile >> "CfgMagazines" >> _itemName >> "picture");
            };
            _list lbSetPicture [_index, _picture];
        };

    } forEach _items;

    _buySellButton ctrlSetText "Sell";

    _giftButton ctrlShow true;

    _checkbox ctrlShow false;

    if (lbSize _list isEqualTo 0) then {
        _buySellButton ctrlEnable false;
        _giftButton ctrlEnable false;
        _IconCtrl ctrlSetText nil;
        _IconTxt ctrlSetText nil;
        ctrlSetText [1001, "You have nothing to Sell..."];
    } else {
        _buySellButton ctrlEnable true;
        _giftButton ctrlEnable true;
        };
    };
};

        // Update the player's funds
        private _playerFunds = player getVariable QCLASS(currency);
        ctrlSetText [1003, format ["%3: %1 %2", EGVAR(money,symbol), [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

        // Update the shop's funds
        private _shop = _trader getVariable "shop";
        private _shopFunds = _shop select (_shop findIf {_x select 0 isEqualTo "ShopFunds"}) select 1;
        ctrlSetText [1002, format ["%3: %1 %2", EGVAR(money,symbol), [_shopFunds, 1, 2, true] call CBA_fnc_formatNumber, _shopName]];

}, []] call CBA_fnc_waitUntilAndExecute;
