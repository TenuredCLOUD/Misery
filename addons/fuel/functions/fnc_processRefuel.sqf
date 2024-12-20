#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Refuel UI List populater
 * Defines the selected refuel option, and passes values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_processRefuel
 *
*/

private _dialog = findDisplay 982385;
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex == -1) exitWith {
    ctrlSetText [1001, "No Refuel option selected..."];
};

if !(_selectedIndex == -1) exitWith {

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

[] call FUNC(refillstart);
};
