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

        [player] call FUNC(nearVehicle) params ["_nearVehicle", "_vehicle"];

        private _dialog = findDisplay 274839;
        private _iconCtrl = _dialog displayCtrl 1200;
        private _iconName = _dialog displayCtrl 1002;

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

            {
                _x ctrlShow false;
            } forEach ["_fuelIcon", "_fuelBar", "_powerIcon", "_powerBar", "_oilIcon", "_oilBar", "_coolantIcon", "_coolantBar"];
        };

        private _fuelLevel = fuel _vehicle;
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
        private _batteryType = _vehicle getVariable [QGVAR(batteryType), nil];
        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 0];
        private _oilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
        private _coolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

        [_vehicle, _batteryType] call FUNC(countBatteries) params ["_installedBatteries"];
        [_vehicle, _batteryType, _requiredBatteries] call FUNC(getBatteryCharge) params ["_totalCharge", "_maxCharge"];

        _batteryCtrl ctrlSetText format ["(Batteries: %1/%2)", _installedBatteries, _requiredBatteries];
        _fuelBar progressSetPosition _fuelLevel;
        _powerBar progressSetPosition (_totalCharge / _maxCharge);
        _oilBar progressSetPosition _oilLevel;

        // Remove coolant bar for aircraft (most aircraft use air flow for cooling components)
        if (_vehicle isKindOf "plane" || _vehicle isKindOf "helicopter") then {
            {
                _x ctrlShow false;
            } forEach ["_coolantIcon", "_coolantBar"];
        } else {
            _coolantBar progressSetPosition _coolantLevel;
        };

        private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
        private _cfg = configFile >> "CfgVehicles" >> typeOf _vehicle;

        if (isClass _cfg) then {
            private _picPath = getText (_cfg >> "editorPreview");
            _iconCtrl ctrlSetText _picPath;
            _iconName ctrlSetText _vehicleName;
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
