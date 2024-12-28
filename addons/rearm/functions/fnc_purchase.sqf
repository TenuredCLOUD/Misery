#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Rearm Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_rearm_fnc_purchase;
 *
 * Public: No
*/

private _dialog = findDisplay 982383;
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex == -1) exitWith {
    ctrlSetText [1001, "No Resupply option selected..."];
};

if !(_selectedIndex == -1) exitWith {

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

[] call FUNC(rearmstart);
};


