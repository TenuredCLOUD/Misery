#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Returns the charge level of batteries in vehicles inventory - sorted in decending order
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Battery Type <STRING>
 * 2: Required Battery Count <NUMBER>
 *
 * Return Value:
 * 0: Total Charge <NUMBER>
 * 1: Maximum allowed charge <NUMBER>
 *
 * Example:
 * [] call misery_maintenance_fnc_getBatteryCharge
 *
*/

params ["_vehicle", "_batteryType", "_requiredBatteries"];

private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

private _totalCharge = _batteryLevel;
private _maxCharge = _requiredBatteries * 1;

[_totalCharge, _maxCharge]
