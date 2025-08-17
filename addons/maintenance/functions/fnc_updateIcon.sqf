#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Vehicle Icon Updater
 * Updates vehicle icon and name in maintenance dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call misery_maintenance_fnc_icon;
 *
 * Public: No
*/

[{!isNull findDisplay 274839},{
    [{
        params ["_args", "_handle"];

        if (isNull findDisplay 274839 || !alive player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        [player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

        [_vehicle] call EFUNC(common,getObjectData) params ["_displayName", "_picture"];

        private _dialog = findDisplay 274839;
        private _iconCtrl = _dialog displayCtrl 1200;
        private _iconName = _dialog displayCtrl 1002;
        private _batteryStatusText = _dialog displayCtrl 1003;

        private _fuelIcon = _dialog displayCtrl 2010;
        private _fuelBar = _dialog displayCtrl 2000;
        private _powerIcon = _dialog displayCtrl 2011;
        private _powerBar = _dialog displayCtrl 2001;
        private _oilIcon = _dialog displayCtrl 2012;
        private _oilBar = _dialog displayCtrl 2002;
        private _coolantIcon = _dialog displayCtrl 2013;
        private _coolantBar = _dialog displayCtrl 2003;

        if (isNil "_vehicle") exitWith {
            _iconName ctrlSetText "No Vehicle to Repair...";
            [274839, [2010, 2000, 2011, 2001, 2012, 2002, 2013, 2003], false] call EFUNC(common,displayShowControls);
        };

        private _fuelLevel = fuel _vehicle;
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 100];
        private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];
        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
        private _oilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
        private _coolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];

        [_vehicle, _batteryType, _requiredBatteries] call FUNC(getBatteryCharge) params ["_totalCharge", "_maxCharge"];

        _fuelBar progressSetPosition _fuelLevel;
        _powerBar progressSetPosition (_totalCharge / _maxCharge);
        _oilBar progressSetPosition _oilLevel;

        private _batteryStatus = format ["Battery - %1/%2 (%3%% charge)", _installedBatteries, _requiredBatteries, _batteryLevel];
        _batteryStatusText ctrlSetText _batteryStatus;

        // Remove coolant bar for aircraft (most aircraft use air flow for cooling components)
        if (_vehicle isKindOf "plane" || _vehicle isKindOf "helicopter") then {
            [274839, [2013, 2003], false] call EFUNC(common,displayShowControls);
        } else {
            _coolantBar progressSetPosition _coolantLevel;
        };

        _iconCtrl ctrlSetText _picture;
        _iconName ctrlSetText _displayName;
    }, 0.5] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
