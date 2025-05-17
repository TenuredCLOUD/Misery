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

[{!isNull findDisplay 982390}, {

    private _dialog = findDisplay 982390;
    private _list = _dialog displayCtrl 1500;
    private _iconCtrl = _dialog displayCtrl 1200;
    private _iconTxt = _dialog displayCtrl 1004;
    private _currselection = lbCurSel _list;

    if (_currselection isEqualTo -1) exitWith {
        _iconCtrl ctrlSetText "";
        _iconTxt ctrlSetText "";
    };

    private _selectedItem = _list lbData _currselection;
    private _cfg = configFile >> "CfgWeapons" >> _selectedItem;
    private _picPath = "";
    private _descShort = "";

    if (isClass _cfg) then {
        _picPath = getText (_cfg >> "picture");
        _descShort = getText (_cfg >> "descriptionShort");
    } else {
        _cfg = configFile >> "CfgMagazines" >> _selectedItem;
        if (isClass _cfg) then {
            _picPath = getText (_cfg >> "picture");
            _descShort = getText (_cfg >> "descriptionShort");
        } else {
            _cfg = configFile >> "CfgVehicles" >> _selectedItem;
            if (isClass _cfg) then {
                _picPath = getText (_cfg >> "editorPreview");
                _descShort = getText (_cfg >> "displayName");
            };
        };
    };

    _iconCtrl ctrlSetText _picPath;
    _iconTxt ctrlSetStructuredText parseText _descShort;
}, []] call CBA_fnc_waitUntilAndExecute;
