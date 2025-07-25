#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes vehicles with batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_initVehicles;
 *
 * Public: No
*/

private _vehicleClasses = [];
{
    _vehicleClasses pushBack (_x select 0);
} forEach EGVAR(common,vehicleData);

{
    private _entity = _x;
    private _vehicleType = typeOf _entity;
    if (_vehicleType in _vehicleClasses) then {
        private _vehicleData = EGVAR(common,vehicleData) select {(_x select 0) isEqualTo _vehicleType};
        private _batteryCount = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 6} else {1};
        private _batteryType = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 5} else {"misery_autoBattery"};
        _entity setVariable [QGVAR(batteryCount), _batteryCount, true];
        _entity setVariable [QGVAR(batteryType), _batteryType, true];
        _entity setVariable [QGVAR(installedBatteries), 0, true];
        _entity setVariable [QGVAR(batteryLevel), 0, true];
        _entity setVariable [QGVAR(oilLevel), 0, true];
        _entity setVariable [QGVAR(coolantLevel), 0, true];
    };
} forEach (allMissionObjects "Car") + (allMissionObjects "Tank") + (allMissionObjects "Air");

addMissionEventHandler ["EntityCreated", {
    params ["_entity"];
    private _vehicleType = typeOf _entity;
    if (_vehicleType in _vehicleClasses) then {
        private _vehicleData = EGVAR(common,vehicleData) select {(_x select 0) isEqualTo _vehicleType};
        private _batteryCount = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 6} else {1};
        private _batteryType = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 5} else {"misery_autoBattery"};
        _entity setVariable [QGVAR(batteryCount), _batteryCount, true];
        _entity setVariable [QGVAR(batteryType), _batteryType, true];
        _entity setVariable [QGVAR(installedBatteries), 0, true];
        _entity setVariable [QGVAR(batteryLevel), 0, true];
        _entity setVariable [QGVAR(oilLevel), 0, true];
        _entity setVariable [QGVAR(coolantLevel), 0, true];
    };
}];
