#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populate inventory RscCombo with categories
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call misery_inventory_fnc_populateCategories;
 *
*/

params ["_display"];

private _combo = _display displayCtrl 2100;
lbClear _combo;

private _categories = [];

{
    _categories pushBackUnique (_x select 1)
} forEach GVAR(itemData);

{
    private _index = _combo lbAdd _x;
    _combo lbSetData [_index, _x]; // Store category name
} forEach _categories;

_combo lbSetCurSel 0; // Default to first category
