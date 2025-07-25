#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Counts the number of batteries in a vehicle using it's battery type
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Battery Type <STRING>
 *
 * Return Value:
 * 0: Battery Count <NUMBER>
 *
 * Example:
 * [] call misery_maintenance_fnc_countBatteries
 *
*/

params ["_vehicle", "_batteryType"];

private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];

_installedBatteries
