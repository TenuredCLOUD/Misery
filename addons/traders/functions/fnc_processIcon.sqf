#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop icons
 * Processes Lists of Icons as well as text but in the icon controls
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_processIcon;
 *
 * Public: No
*/

[{!isNull findDisplay 982390},
{
        private _dialog = findDisplay 982390;
        private _list = _dialog displayCtrl 1500;
        private _categoryDropdown = _dialog displayCtrl 2100;
        private _currselection = lbCurSel _list;
        private _currselectionCat = lbCurSel _categoryDropdown;
        private _selectedItem = _list lbData _currselection;
        private _selectedCategory = _categoryDropdown lbData _currselectionCat;
        private _IconCtrl = _dialog displayCtrl 1200;
        private _IconTxt = _dialog displayCtrl 1004;

    if (_currselection isNotEqualTo -1) then {
    _cfg = configFile >> "CfgWeapons" >> _selectedItem;
    if (isClass _cfg) then {
        _picPath = getText (_cfg >> "picture");
        _IconCtrl ctrlSetText _picPath;
        _descshort = format ["%1", getText (_cfg >> "descriptionShort")];
        _IconTxt ctrlSetStructuredText parseText _descshort;
    };

    _cfg = configFile >> "CfgMagazines" >> _selectedItem;
    if (isClass _cfg) then {
        _picPath = getText (_cfg >> "picture");
        _IconCtrl ctrlSetText _picPath;
        _descshort = format ["%1", getText (_cfg >> "descriptionShort")];
        _IconTxt ctrlSetStructuredText parseText _descshort;
    };

    _cfg = configFile >> "CfgVehicles" >> _selectedItem;
    if (isClass _cfg) then {
        _picPath = getText (_cfg >> "editorPreview");
        _IconCtrl ctrlSetText _picPath;
        _descshort = format ["%1", getText (_cfg >> "displayName")];
        _IconTxt ctrlSetStructuredText parseText _descshort;
    };
} else {
    _IconCtrl ctrlSetText nil;
    _IconTxt ctrlSetText nil;
};

}, []] call CBA_fnc_waitUntilAndExecute;
