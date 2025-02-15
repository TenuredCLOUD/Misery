#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Refuel Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_refuel_fnc_processPurchase;
 *
 * Public: No
*/

private _dialog = findDisplay 982384;
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex isEqualTo -1) exitWith {
    ctrlSetText [1001, "No Refuel option selected..."];
};

if (_selectedIndex isNotEqualTo -1) exitWith {

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

[] call FUNC(start);
};


