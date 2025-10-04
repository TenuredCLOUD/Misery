#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop UI Populator
 * Updates trader shop UI with items, prices, and stock
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_updateShop;
 *
*/

[{!isNull findDisplay 982390}, {
    private _dialog = findDisplay 982390;
    private _list = _dialog displayCtrl 1500;
    private _categoryDropdown = _dialog displayCtrl 2100;
    private _buySellButton = _dialog displayCtrl 1602;
    private _giftButton = _dialog displayCtrl 1603;
    private _checkbox = _dialog displayCtrl 2800;
    private _iconCtrl = _dialog displayCtrl 1200;
    private _iconTxt = _dialog displayCtrl 1004;
    private _infoBox = _dialog displayCtrl 1001;
    private _trader = player getVariable [QGVAR(currentTrader), objNull];
    private _shop = _trader getVariable [QGVAR(shop), []];

    if (isNull _trader) exitWith {(findDisplay 982390) closeDisplay 2};

    if (_shop isEqualTo []) exitWith {(findDisplay 982390) closeDisplay 2};

    _shop params ["_traderClass", "_shopName", "_items", "_shopFunds"];
    ctrlSetText [1000, _shopName];

    private _pweapon = primaryWeapon player;
    private _hweapon = handgunWeapon player;
    private _sweapon = secondaryWeapon player;
    private _compatibleItemsP = if (_pweapon isNotEqualTo "") then {[_pweapon] call CBA_fnc_compatibleItems} else {[]};
    private _compatibleMagazinesP = if (_pweapon isNotEqualTo "") then {[_pweapon] call CBA_fnc_compatibleMagazines} else {[]};
    private _compatibleItemsH = if (_hweapon isNotEqualTo "") then {[_hweapon] call CBA_fnc_compatibleItems} else {[]};
    private _compatibleMagazinesH = if (_hweapon isNotEqualTo "") then {[_hweapon] call CBA_fnc_compatibleMagazines} else {[]};
    private _compatibleItemsS = if (_sweapon isNotEqualTo "") then {[_sweapon] call CBA_fnc_compatibleItems} else {[]};
    private _compatibleMagazinesS = if (_sweapon isNotEqualTo "") then {[_sweapon] call CBA_fnc_compatibleMagazines} else {[]};

    lbClear _list;

    private _currSelectionCat = lbCurSel _categoryDropdown;
    private _selectedCategory = if (_currSelectionCat >= 0) then {_categoryDropdown lbData _currSelectionCat} else {""};

    if (GVAR(currentAction) isEqualTo "buy") then {
        {
            _x params ["_itemName", "_basePrice", "_stock", "_minCostFactor", "_maxCostFactor", "_customAction", "_category"];
            [_itemName] call EFUNC(common,getObjectData) params ["_objectDisplayName", "_objectPicture"];
            [_itemName] call EFUNC(common,getItemData) params ["_itemDisplayName", "_itemPicture"];
            if (_selectedCategory isEqualTo "" || _category isEqualTo _selectedCategory) then {
                if (cbChecked _checkbox && !(_itemName in (_compatibleItemsP + _compatibleMagazinesP + _compatibleItemsH + _compatibleMagazinesH + _compatibleItemsS + _compatibleMagazinesS))) then {
                    continue;
                };
                private _price = [_basePrice, _stock, _minCostFactor, _maxCostFactor, true] call FUNC(calculatePrice);

                private _index = _list lbAdd format ["%1 - Price: %2 - Stock: %3", [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), [_price, 1, 2, true] call CBA_fnc_formatNumber, round(_stock)];
                _list lbSetData [_index, _itemName];

                    if ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)) then {
                        _list lbSetPicture [_index, _objectPicture];
                    } else {
                        _list lbSetPicture [_index, _itemPicture];
                    };

                [QUOTE(COMPONENT_BEAUTIFIED), format ["Added item %1: price %2, stock %3", [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), _price, _stock]] call EFUNC(common,debugMessage);
            };
        } forEach _items;

        _buySellButton ctrlSetText "Buy";
        [982390, [1603], false] call EFUNC(common,displayShowControls);
        [982390, [2800], true] call EFUNC(common,displayShowControls);
        _buySellButton ctrlEnable (lbSize _list > 0);

    } else {
    {
        _x params ["_itemName", "_basePrice", "_stock", "_minCostFactor", "_maxCostFactor", "_customAction", "_category"];
        [_itemName] call EFUNC(common,getObjectData) params ["_objectDisplayName", "_objectPicture"];
        [_itemName] call EFUNC(common,getItemData) params ["_itemDisplayName", "_itemPicture"];
        if (_selectedCategory isEqualTo "" || _category isEqualTo _selectedCategory) then {
            if ([_itemName] call EFUNC(common,countItem) isEqualTo 0) then {
                continue;
            };
            private _price = [_basePrice, _stock, _minCostFactor, _maxCostFactor, false] call FUNC(calculatePrice);

            private _itemCount = [_itemName] call EFUNC(common,countItem);
            private _index = _list lbAdd format ["%1 - Price: %2 - Inventory: %3", [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), [_price, 1, 2, true] call CBA_fnc_formatNumber, _itemCount];
            _list lbSetData [_index, _itemName];

                if ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)) then {
                    _list lbSetPicture [_index, _objectPicture];
                } else {
                    _list lbSetPicture [_index, _itemPicture];
                };

            [QUOTE(COMPONENT_BEAUTIFIED), format ["Added item %1: price %2, inventory %3", [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), _price, _itemCount]] call EFUNC(common,debugMessage);
        };
    } forEach _items;

    _buySellButton ctrlSetText "Sell";
    [982390, [1603], true] call EFUNC(common,displayShowControls);
    [982390, [2800], false] call EFUNC(common,displayShowControls);
    if (lbSize _list isEqualTo 0) then {
        _buySellButton ctrlEnable false;
        _giftButton ctrlEnable false;
        _iconCtrl ctrlSetText "";
        _iconTxt ctrlSetText "";
        _infoBox ctrlSetText "You have nothing to sell...";
    } else {
        _buySellButton ctrlEnable true;
        _giftButton ctrlEnable true;
    };
};

    private _playerFunds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];
    ctrlSetText [1003, format ["%3: %1 %2", EGVAR(currency,symbol), [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];
    ctrlSetText [1002, format ["%3: %1 %2", EGVAR(currency,symbol), [_shopFunds, 1, 2, true] call CBA_fnc_formatNumber, _shopName]];

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Listbox populated with %1 items", lbSize _list]] call EFUNC(common,debugMessage);
}, []] call CBA_fnc_waitUntilAndExecute;
