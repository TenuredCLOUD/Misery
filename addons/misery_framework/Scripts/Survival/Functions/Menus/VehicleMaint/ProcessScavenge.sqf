/* -----------------------------------
Misery Vehicle Mechanic Repair Shop UI List populater
Defines the selected purchase option, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _dialog = findDisplay 982382; 
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex == -1) exitWith {
	ctrlSetText [1001, "No Repair option selected..."];
};

if !(_selectedIndex == -1) exitWith {

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

[] execVM "Misery\Scripts\Modules\Mechanic\Repair.sqf";
};


