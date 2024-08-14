#include "..\script_component.hpp"
/*
Misery Vehicle Maintenance Vehicle icon updater
Designed specifically for Misery mod
by TenuredCLOUD
*/

disableSerialization;

waitUntil {!isNull findDisplay 274839};

private _dialog = findDisplay 274839;
private _IconCtrl = _dialog displayCtrl 1200;
private _IconName = _dialog displayCtrl 1002;

if (MiseryTarget_VehName isEqualTo "") exitWith {
        _IconName ctrlSetText "No Vehicle to Repair...";
    };

private _Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");

if (!isNil "_Vehiclename") then {
    _cfg = configFile >> "CfgVehicles" >> MiseryTarget_VehName;
    if (isClass _cfg) exitWith {
        _picPath = getText (_cfg >> "editorPreview");
        _IconCtrl ctrlSetText _picPath;
        _IconName ctrlSetText _Vehiclename;
    };
};
