#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Anvil recipe output
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_anvil_fnc_showRecipe
 *
 * Public: No
*/

private _dialog = findDisplay 274840;
private _selectedItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(data) select {(_x select 0) isEqualTo _selectedItem} select 0;

if (isNil "_recipe") exitWith {
    ctrlSetText [1001, "No smelt materials selected..."];
};

private _requiredItems = _recipe select 1;
private _text = "Required materials:";

{
    private _item = _x select 0;
    private _count = _x select 1;

    [_item] call EFUNC(common,getItemData) params ["_displayName"];

    _text = _text + format ["%3%1 x%2%3", _displayName, _count, endl];
} forEach _requiredItems;

ctrlSetText [1001, _text];
