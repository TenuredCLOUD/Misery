#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initialize inventory dialog
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call misery_inventory_fnc_initInventoryDialog;
 *
 * Public: No
*/

params ["_dialog"];

private _combo = _dialog displayCtrl 2100;
lbClear _combo;

// Get unique categories from itemData
private _categories = [];
{
    private _category = _x select 0;
    if !(_category in _categories) then {
        _categories pushBack _category;
    };
} forEach GVAR(itemData);

// Populate combo
{
    private _index = _combo lbAdd _x;
    _combo lbSetData [_index, _x];
} forEach _categories;

// Set event handler
_combo ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_index"];
    [ctrlParent _control, _index] call FUNC(populateItemsList);
}];

// Select first category
_combo lbSetCurSel 0;
