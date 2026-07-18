#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_TradersData")) then {
        call FUNC(trackTraders);
        call FUNC(parseData);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_TradersData class not found in description.ext, skipping..."] call EFUNC(common,debugMessage);
    };

    [QGVAR(serverPurchase), {
        params ["_player", "_trader", "_itemName", "_buyPrice", "_purchaseCode"];

        private _shop = _trader getVariable [QGVAR(shop), []];
        private _items = _shop select 2;
        private _shopFunds = _shop select 3;
        private _itemIndex = _items findIf {(_x select 0) isEqualTo _itemName};

        if (_itemIndex < 0) exitWith {};
        private _itemData = _items select _itemIndex;
        private _stock = _itemData select 2;

        if (_stock <= 0) exitWith {};

        _itemData set [2, _stock - 1];
        _shop set [3, _shopFunds + _buyPrice];

        _trader setVariable [QGVAR(shop), _shop, true];

        [QGVAR(clientPurchaseComplete), [_itemName, _buyPrice, _purchaseCode], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(serverSell), {
        params ["_player", "_trader", "_itemName", "_sellPrice"];

        private _shop = _trader getVariable [QGVAR(shop), []];
        private _items = _shop select 2;
        private _shopFunds = _shop select 3;
        private _itemIndex = _items findIf {(_x select 0) isEqualTo _itemName};

        if (_itemIndex < 0) exitWith {};
        if (_shopFunds < _sellPrice) exitWith {};

        private _itemData = _items select _itemIndex;
        private _stock = _itemData select 2;

        _itemData set [2, _stock + 1];
        _shop set [3, _shopFunds - _sellPrice];
        _trader setVariable [QGVAR(shop), _shop, true];

        [QGVAR(clientSellComplete), [_itemName, _sellPrice], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(serverGift), {
        params ["_player", "_trader", "_itemName"];

        private _shop = _trader getVariable [QGVAR(shop), []];
        private _items = _shop select 2;
        private _itemIndex = _items findIf {(_x select 0) isEqualTo _itemName};

        if (_itemIndex < 0) exitWith {};

        private _itemData = _items select _itemIndex;
        private _stock = _itemData select 2;

        _itemData set [2, _stock + 1];
        _trader setVariable [QGVAR(shop), _shop, true];

        [QGVAR(clientGiftComplete), [_itemName], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {

    [QGVAR(clientPurchaseComplete), {
        params ["_itemName", "_buyPrice", "_purchaseCode"];

        [_itemName] call EFUNC(common,getObjectData) params ["_objectDisplayName"];
        [_itemName] call EFUNC(common,getItemData) params ["_itemDisplayName"];

        [-_buyPrice] call EFUNC(currency,modifyMoney);

        if (_purchaseCode isNotEqualTo "") then {
            call compile _purchaseCode;
        } else {
            [ACE_player, _itemName, true] call CBA_fnc_addItem;
        };

        ctrlSetText [1001, format [localize LSTRING(PurchaseSuccess), [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), EGVAR(currency,symbol), [_buyPrice, 1, 2, true] call CBA_fnc_formatNumber]];

        [] call FUNC(updateShop);
        [] call FUNC(processIcon);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(clientSellComplete), {
        params ["_itemName", "_sellPrice"];

        [_itemName] call EFUNC(common,getObjectData) params ["_objectDisplayName"];
        [_itemName] call EFUNC(common,getItemData) params ["_itemDisplayName"];

        [_sellPrice] call EFUNC(currency,modifyMoney);

        if (_itemName in magazines ACE_player) then {
            [ACE_player, _itemName] call CBA_fnc_removeMagazine;
        } else {
            [ACE_player, _itemName] call CBA_fnc_removeItem;
        };

        ctrlSetText [1001, format [localize LSTRING(SellSuccess), [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck)), EGVAR(currency,symbol), [_sellPrice, 1, 2, true] call CBA_fnc_formatNumber]];
        [] call FUNC(updateShop);
        [] call FUNC(processIcon);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(clientGiftComplete), {
        params ["_itemName"];

        [_itemName] call EFUNC(common,getObjectData) params ["_objectDisplayName"];
        [_itemName] call EFUNC(common,getItemData) params ["_itemDisplayName"];

        if (_itemName in magazines ACE_player) then {
            [ACE_player, _itemName] call CBA_fnc_removeMagazine;
        } else {
            [ACE_player, _itemName] call CBA_fnc_removeItem;
        };

        ctrlSetText [1001, format [localize LSTRING(GiftSuccess), [_itemDisplayName, _objectDisplayName] select ([_itemName, "CfgVehicles"] call EFUNC(common,configCheck))]];
        [] call FUNC(updateShop);
        [] call FUNC(processIcon);
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
