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

[{!isNull findDisplay 982383},
{
private _dialog = findDisplay 982383;
private _iconCtrl = _dialog displayCtrl 1602;
private _iconName = _dialog displayCtrl 1603;

if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _iconName ctrlSetText "No Vehicle to Resupply...";
    };

private _vehicleName = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

if (!isNil "_vehicleName") then {
    _vehicleCfg = configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType);
    if (isClass _vehicleCfg) exitWith {
        _picPath = getText (_vehicleCfg >> "editorPreview");
        _iconCtrl ctrlSetText _picPath;
        _iconName ctrlSetText _vehicleName;
        };
    };
}, []] call CBA_fnc_waitUntilAndExecute;
