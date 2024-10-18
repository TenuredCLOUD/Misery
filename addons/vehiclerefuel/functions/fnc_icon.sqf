#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Refuel Vehicle Icon & name updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_vehiclerefuel_fnc_icon;
 *
 * Public: No
*/

disableSerialization;

waitUntil {!isNull findDisplay 982384};

private _dialog = findDisplay 982384;
private _IconCtrl = _dialog displayCtrl 1602;
private _IconName = _dialog displayCtrl 1603;

if (MiseryTarget_VehName isEqualTo "") exitWith {
        _IconName ctrlSetText "No Vehicle to Refuel...";
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
