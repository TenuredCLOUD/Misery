/*
Misery MedTreatment UI List populater
Defines the selected purchase option, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
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
    [] execVM "\z\misery\addons\medzone\fnc_Medzonestart.sqf";
    };
    case "Radheal14": {
    [] execVM "\z\misery\addons\medzone\fnc_Radheal14.sqf";
    };
    case "Radheal12": {
    [] execVM "\z\misery\addons\medzone\fnc_Radheal12.sqf";
    };
    case "Radheal34": {
   	[] execVM "\z\misery\addons\medzone\fnc_Radheal34.sqf";
    };
    case "RadhealALL": {
    [] execVM "\z\misery\addons\medzone\fnc_RadhealALL.sqf";
    };
};



