#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * resupply Vehicle Icon & name updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_rearm_fnc_icon;
 *
 * Public: No
*/

disableSerialization;

waitUntil {!isNull findDisplay 982383};

private _dialog = findDisplay 982383;
private _IconCtrl = _dialog displayCtrl 1602;
private _IconName = _dialog displayCtrl 1603;

if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _IconName ctrlSetText "No Vehicle to Resupply...";
    };

private _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

if (!isNil "_Vehiclename") then {
    _cfg = configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType);
    if (isClass _cfg) exitWith {
        _picPath = getText (_cfg >> "editorPreview");
        _IconCtrl ctrlSetText _picPath;
        _IconName ctrlSetText _Vehiclename;
    };
};
