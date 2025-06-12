#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populate inventory RscCombo with player items
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call misery_inventory_fnc_populateItemsCombo;
 *
*/

params ["_display"];

private _combo = _display displayCtrl 1030;
lbClear _combo;

private _inventoryItems = items player;
{
    private _itemClass = toUpper _x;
    private _itemData = GVAR(itemData) select {toUpper (_x select 0) isEqualTo _itemClass};
    if (count _itemData > 0) then {
        private _displayName = getText (configFile >> "CfgMagazines" >> _itemClass >> "displayName");
        if (_displayName == "") then {
            _displayName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");
        };
        if (_displayName == "") then { _displayName = _itemClass; }; // Fallback to classname
        private _index = _combo lbAdd _displayName;
        _combo lbSetData [_index, _itemClass];
    };
} forEach _inventoryItems;

_combo lbSetCurSel 0;
