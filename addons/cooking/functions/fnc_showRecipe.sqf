#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Framework Recipe Formatter
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cooking_fnc_showRecipe
 *
 * Public: No
*/

private _dialog = findDisplay 982379;
private _list = _dialog displayCtrl 1500;
private _currselection = lbCurSel _list;
private _selectedOutputItem = _list lbData _currselection;
private _selectedRecipe = [];
private _playerRecipes = player getVariable "Misery_Cooking_DataSet";

{
    if (_x select 0 isEqualTo _selectedOutputItem) then {
        _selectedRecipe = _x;
    };
} forEach _playerRecipes;

if (count _selectedRecipe > 0) then {
    private _requirements = _selectedRecipe select 1;
    private _reqList = _dialog displayCtrl 1502;

    lbClear _reqList;

    private _recipeName = _selectedRecipe select 0;

    private _itemDisplayName_1 = getText (configFile >> "CfgWeapons" >> _recipeName >> "displayName");
    if (_itemDisplayName_1 == "") then {
        _itemDisplayName_1 = getText (configFile >> "CfgMagazines" >> _recipeName >> "displayName");
    };

    _reqList lbAdd format ["%1 Requires:", _itemDisplayName_1];

    private _cookingMethod = "";
    {
        private _item = _x select 0;
        private _count = _x select 1;
        if (_item == "CookingMethod") then {
            _cookingMethod = _x select 1;
        } else {
            if (_item != "CookingTime" && {_count > 0}) then {
                private _itemDisplayName_2 = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
                if (_itemDisplayName_2 == "") then {
                    _itemDisplayName_2 = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
                };
                private _index = _reqList lbAdd format ["%1 x %2", _itemDisplayName_2, _count];
                _reqList lbSetData [_index, _item];
                _reqList lbSetPicture [_index, getText (configFile >> "CfgWeapons" >> _item >> "picture")];
            };
        };
    } forEach _requirements;

    _reqList lbAdd format ["Cooking Method: %1", _cookingMethod];

} else {
    ctrlSetText [1001, "No Recipe selected..."];
};






