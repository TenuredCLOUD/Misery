#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Recipe Formatter
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_crafting_fnc_showRecipe
 *
 * Public: No
*/

private _dialog = findDisplay 982376;
private _selectedOutputItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(craftingRecipes) select {(_x select 0) isEqualTo _selectedOutputItem} select 0;

if (isNil "_recipe") exitWith {
    ctrlSetText [1001, "No recipe selected..."];
};

private _requiredItems = _recipe select 1;
private _text = "Required Items:";

{
    private _item = _x select 0;
    private _count = _x select 1;

    private _itemDisplayName = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
    if (_itemDisplayName isEqualTo "") then {
        _itemDisplayName = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
    };
    if (_itemDisplayName isEqualTo "") then {
        _itemDisplayName = _item;
    };

    _text = _text + format ["%3%1 x%2%3", _itemDisplayName, _count, endl];
} forEach _requiredItems;

ctrlSetText [1001, _text];
