#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle repair Vehicle Icon & name updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_repair_fnc_icon;
 *
 * Public: No
*/

disableSerialization;

[{!isNull findDisplay 982386},
{

private _dialog = findDisplay 982386;
private _IconCtrl = _dialog displayCtrl 1602;
private _IconName = _dialog displayCtrl 1603;

if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
    _IconName ctrlSetText "No Vehicle to Repair...";
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
}, []] call CBA_fnc_waitUntilAndExecute;
