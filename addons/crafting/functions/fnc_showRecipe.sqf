#include "..\script_component.hpp"
/*
Misery Crafting Framework Recipe Formatter
Designed specifically for Misery mod
by TenuredCLOUD
*/

private _dialog = findDisplay 982376;
private _list = _dialog displayCtrl 1500;
private _currselection = lbCurSel _list;
private _selectedOutputItem = _list lbData _currselection;
private _selectedRecipe = [];
private _playerRecipes = player getVariable "Misery_Crafting_DataSet";

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

    _reqList lbAdd format ["Requirements for %1", _itemDisplayName_1];

    {
        private _item = _x select 0;
        private _count = _x select 1;
        if (_item != "CraftingTime" && _item != "OutputCount" && _item != "ToBeReplaced" && _item != "Audio" && {_count > 0}) then {
            private _itemDisplayName_2 = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
            if (_itemDisplayName_2 == "") then {
                _itemDisplayName_2 = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
            };
            private _index = _reqList lbAdd format ["%1 x %2", _itemDisplayName_2, _count];
            _reqList lbSetData [_index, _item];
            _reqList lbSetPicture [_index, getText (configFile >> "CfgWeapons" >> _item >> "picture")];
        };
    } forEach _requirements;
} else {
    ctrlSetText [1001, "No Recipe selected..."];
};













