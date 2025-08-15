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
 * [] call misery_refuel_fnc_icon;
 *
 * Public: No
*/

disableSerialization;

[{!isNull findDisplay 982384},
{

    private _dialog = findDisplay 982384;
    private _iconCtrl = _dialog displayCtrl 1602;
    private _iconName = _dialog displayCtrl 1603;

    [player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

    if (_nearestVehicle isEqualTo []) exitWith {
        _iconName ctrlSetText "No Vehicle to Refuel...";
    };

    [_nearestVehicle] call EFUNC(common,getObjectData) params ["_displayName", "_picture"];

    _iconCtrl ctrlSetText _picture;
    _iconName ctrlSetText _displayName;

}, []] call CBA_fnc_waitUntilAndExecute;
