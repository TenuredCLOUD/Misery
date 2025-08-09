#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Scavenge Handler
 * Scavenges parts or batteries from vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, "Battery"] call misery_maintenance_fnc_scavenge;
 *
 * Public: No
*/

params ["_vehicle", "_hitpoint"];

if (isNull _vehicle || _hitpoint isEqualTo "") exitWith {systemChat "Invalid vehicle or hitpoint.";};

private _item = "";
private _hitpointLower = toLower _hitpoint;

// Find vehicle data in EGVAR(common,vehicleData)
private _vehicleData = EGVAR(common,vehicleData) select {(_x select 0) isEqualTo typeOf _vehicle};
private _batteryType = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 6} else {"misery_autoBattery"};
private _batteryCount = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 7} else {1};

switch (true) do {
    case (_hitpointLower find "optic" > -1): {_item = "glass";};
    case (_hitpointLower find "track" > -1): {_item = "spare_track";};
    case (_hitpointLower find "engine" > -1): {_item = "engine_part";};
    case (_hitpointLower find "wheel" > -1): {_item = "spare_wheel";};
    case (_hitpointLower isEqualTo "battery"): {_item = _batteryType;};
    default {_item = "scrap_metal";};
};

if (_item isEqualTo "") exitWith {systemChat "Nothing to scavenge from this part.";};

private _player = player;

if (_hitpointLower isEqualTo "battery") then {
    // Count pseudo-batteries
    private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

    if (_installedBatteries <= 0) exitWith {systemChat "No batteries left to scavenge.";};

    if ([_player, _item, true] call CBA_fnc_addItem) then {
        // Reduce battery count and level
        _installedBatteries = _installedBatteries - 1;
        _vehicle setVariable [QGVAR(installedBatteries), _installedBatteries, true];
        private _chargePerBattery = _batteryLevel / (_installedBatteries + 1);
        _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel - _chargePerBattery, true];

        // Drop battery item with charge info
        private _holder = createVehicle ["GroundWeaponHolder", getPosATL _player, [], 0, "CAN_COLLIDE"];
        _holder addItemCargoGlobal [_item, 1];
        _holder setVariable [QGVAR(batteryCharge), _chargePerBattery, true];
        _player addItem _item;
        systemChat format ["Scavenged 1 %1 with %2%% charge.", _item, _chargePerBattery];

        if (_installedBatteries <= 0) then {
            _vehicle setVariable [QGVAR(batteryLevel), 0, true];
            _vehicle setFuel 0;
        };

        // Refresh UI
        [_vehicle] call FUNC(listed);
    };
} else {
    if (_player canAdd _item) then {
        _vehicle setHitPointDamage [_hitpoint, 1];
        _player addItem _item;
        systemChat format ["Scavenged %1 from %2.", _item, _hitpoint];
        // Refresh UI
        [_vehicle] call FUNC(listed);
    } else {
        systemChat "Not enough inventory space to scavenge.";
    };
};
