#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medtreatment_fnc_processPurchase;
 *
 * Public: No
*/

private _dialog = findDisplay 982381;
private _selectedIndex = lbCurSel 1500; // Get the index of the selected item

private _PurchaseB = _dialog displayCtrl 1600;
private _ExitB = _dialog displayCtrl 1601;

if (_selectedIndex == -1) exitWith {
    ctrlSetText [1001, "No treatment option selected..."];
};

_PurchaseB ctrlShow false;
_ExitB ctrlShow false;

private _treatmentToFile = [
    "Medzonestart",
    "Radheal14",
    "Radheal12",
    "Radheal34",
    "RadhealALL"
];

private _selectedFile = _treatmentToFile select _selectedIndex;

switch (_selectedFile) do {
    case "Medzonestart": {
    [] call EFUNC(medzone,start);
    };
    case "Radheal14": {
    [] call EFUNC(medzone,radheal14);
    };
    case "Radheal12": {
    [] call EFUNC(medzone,radheal12);
    };
    case "Radheal34": {
    [] call EFUNC(medzone,radheal34);
    };
    case "RadhealALL": {
    [] call EFUNC(medzone,radhealAll);
    };
};



