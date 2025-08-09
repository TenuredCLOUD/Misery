#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Repair Handler
 * Adds required items to vehicle inventory or repairs hitpoints
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, "Battery"] call misery_maintenance_fnc_repair;
 *
 * Public: No
*/

params ["_vehicle", "_hitpoint"];

if (isNull _vehicle || _hitpoint isEqualTo "") exitWith {systemChat "Invalid vehicle or hitpoint.";};

private _requiredItem = "";
private _hitpointLower = toLower _hitpoint;

// Find vehicle data in EGVAR(common,vehicleData)
private _vehicleData = EGVAR(common,vehicleData) select {(_x select 0) isEqualTo typeOf _vehicle};
private _batteryType = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 6} else {"misery_autoBattery"};
private _batteryCount = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 7} else {1};

switch (true) do {
    case (_hitpointLower find "optic" > -1): {_requiredItem = "glass";};
    case (_hitpointLower find "track" > -1): {_requiredItem = "spare_track";};
    case (_hitpointLower find "engine" > -1): {_requiredItem = "engine_part";};
    case (_hitpointLower find "wheel" > -1): {_requiredItem = "spare_wheel";};
    case (_hitpointLower isEqualTo "battery"): {_requiredItem = _batteryType;};
    default {_requiredItem = "ToolKit";};
};

if (_requiredItem isEqualTo "") exitWith {systemChat "No repair item defined for this part.";};

private _player = player;

if (_hitpointLower isEqualTo "battery") then {
    // Count batteries in vehicle (pseudo-count)
    private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
    private _missingBatteries = _batteryCount - _installedBatteries;

    if (_missingBatteries <= 0) exitWith {systemChat "All batteries already installed.";};

    private _playerBatteryCount = [_requiredItem] call EFUNC(common,countItem);

    if (_playerBatteryCount >= 1) then {
        // Remove battery from player and vehicle (pseudo-install)
        [_player, _requiredItem] call CBA_fnc_removeItem;
        //[_vehicle, _requiredItem, 1] call CBA_fnc_removeItemCargo;
        _installedBatteries = _installedBatteries + 1;
        _vehicle setVariable [QGVAR(installedBatteries), _installedBatteries, true];
        _vehicle setVariable [QGVAR(batteryLevel), (_vehicle getVariable [QGVAR(batteryLevel), 0]) + (100 / _batteryCount), true];
        _vehicle setFuel (_vehicle getVariable [QGVAR(originalFuel), 1]);
        systemChat format ["Installed 1 %1. Total batteries: %2/%3. Battery level: %4%%.", _requiredItem, _installedBatteries, _batteryCount, _vehicle getVariable [QGVAR(batteryLevel), 0]];
        // Refresh UI
        [_vehicle] call FUNC(listed);
    } else {
        systemChat format ["Need 1 %1 to install.", _requiredItem];
    };
} else {
    if ([_requiredItem] call FUNC(countItems) > 0) then {
        _vehicle setHitPointDamage [_hitpoint, 0];
        [_player, _requiredItem, 1] call CBA_fnc_removeItem;
        systemChat format ["Repaired %1 with %2.", _hitpoint, _requiredItem];
        // Refresh UI
        [_vehicle] call FUNC(listed);
    } else {
        systemChat format ["Missing required item: %1", _requiredItem];
    };
};
