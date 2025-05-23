#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Salbei
 * Inventory handle
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_inventoryHandle
 */

player addEventHandler ["InventoryOpened", {
    [{
        !(isNull (findDisplay 602))
    }, {
        private _display = findDisplay 46 createDisplay QCLASS(inventoryFramework_ui);
        [] call EFUNC(actions,displayActions);

        // Populate category combo
        private _combo = _display displayCtrl 2100;
        lbClear _combo;
        private _playerItems = (items player) + (magazines player);
        private _availableCategories = [];
        {
            private _itemCategory = _x select 0;
            private _itemName = _x select 1;
            if (_itemName in _playerItems && !(_itemCategory in _availableCategories)) then {
                _availableCategories pushBack _itemCategory;
                private _idx = _combo lbAdd _itemCategory;
                _combo lbSetData [_idx, _itemCategory];
            };
        } forEach GVAR(itemData);
        _combo lbSetCurSel 0;

        // Initial items list
        [_display, 0] call FUNC(populateItemsList);

        // Closing handle
        private _closeHandle = [{
            params ["_args", "_handle"];
            private _display = _args select 0;
            if (isNull (findDisplay 602)) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
                _display closeDisplay 1;
            };
            if (isNull objectParent player && {vectorMagnitude velocity player > 1}) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
                _display closeDisplay 1;
                hintSilent "";
                closeDialog 602;
            };
        }, 0, [_display]] call CBA_fnc_addPerFrameHandler;

        player setVariable [QGVAR(inventoryPFH), _closeHandle, false];
        player setVariable [QGVAR(inventoryDisplay), _display, false];
    }, []] call CBA_fnc_waitUntilAndExecute;
}];

// Inventory Closed
player addEventHandler ["InventoryClosed", {
    params ["_unit", "_container"];
    private _handle = player getVariable [QGVAR(inventoryPFH), -1];
    private _display = player getVariable [QGVAR(inventoryDisplay), displayNull];
    hintSilent "";
    if (!isNull _display) then {_display closeDisplay 1;};
    if (_handle isNotEqualTo -1) then {[_handle] call CBA_fnc_removePerFrameHandler;};
    player setVariable [QGVAR(inventoryPFH), nil, false];
    player setVariable [QGVAR(inventoryDisplay), nil, false];
}];

// Put EH
player addEventHandler ["Put", {
    params ["_unit", "_container", "_item"];
    private _display = player getVariable [QGVAR(inventoryDisplay), displayNull];
    if (!isNull _display) then {
        private _combo = _display displayCtrl 2100;
        lbClear _combo;
        private _playerItems = (items player) + (magazines player);
        private _availableCategories = [];
        {
            private _itemCategory = _x select 0;
            private _itemName = _x select 1;
            if (_itemName in _playerItems && !(_itemCategory in _availableCategories)) then {
                _availableCategories pushBack _itemCategory;
                private _idx = _combo lbAdd _itemCategory;
                _combo lbSetData [_idx, _itemCategory];
            };
        } forEach GVAR(itemData);
        private _selectedIndex = lbCurSel _combo;
        if (_selectedIndex < 0 || _selectedIndex >= lbSize _combo) then {_selectedIndex = 0};
        _combo lbSetCurSel _selectedIndex;
        [_display, _selectedIndex] call FUNC(populateItemsList);
    };
}];

// Take EH
player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];
    private _display = player getVariable [QGVAR(inventoryDisplay), displayNull];
    if (!isNull _display) then {
        private _combo = _display displayCtrl 2100;
        lbClear _combo;
        private _playerItems = (items player) + (magazines player);
        private _availableCategories = [];
        {
            private _itemCategory = _x select 0;
            private _itemName = _x select 1;
            if (_itemName in _playerItems && !(_itemCategory in _availableCategories)) then {
                _availableCategories pushBack _itemCategory;
                private _idx = _combo lbAdd _itemCategory;
                _combo lbSetData [_idx, _itemCategory];
            };
        } forEach GVAR(itemData);
        private _selectedIndex = lbCurSel _combo;
        if (_selectedIndex < 0 || _selectedIndex >= lbSize _combo) then {_selectedIndex = 0};
        _combo lbSetCurSel _selectedIndex;
        [_display, _selectedIndex] call FUNC(populateItemsList);
    };
}];
