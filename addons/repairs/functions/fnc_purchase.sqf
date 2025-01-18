#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Mechanic Shop Purchase processor
 * Processes repairing option
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_repairs_fnc_purchase;
 *
 * Public: No
*/

private _dialog = findDisplay 982382;
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex isEqualTo -1) exitWith {
    ctrlSetText [1001, "No Repair option selected..."];
};

if (_selectedIndex isNotEqualTo -1) exitWith {

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

[] call FUNC(repair);
};


