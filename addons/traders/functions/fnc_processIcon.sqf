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

    if ([_selectedItem, "CfgVehicles"] call EFUNC(common,configCheck)) then {
        [_selectedItem] call EFUNC(common,getObjectData) params ["_objectDisplayName", "_objectPicture"];
        _iconCtrl ctrlSetText _objectPicture;
        _iconTxt ctrlSetStructuredText parseText _objectDisplayName;
    } else {
        [_selectedItem] call EFUNC(common,getItemData) params ["", "_itemPicture", "_itemDescription"];
        _iconCtrl ctrlSetText _itemPicture;
        _iconTxt ctrlSetStructuredText parseText _itemDescription;
    };
}, []] call CBA_fnc_waitUntilAndExecute;
