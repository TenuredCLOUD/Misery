#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if object is nearby a vehicle and returns nearest vehicle
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Near Vehicle <BOOL>
 * 1: Nearest Vehicle <OBJECT>
 *
 * Example:
 * [] call misery_maintenance_fnc_nearVehicle
*/
params ["_object"];

if (!isNull objectParent player) exitWith {};

private _nearestObjects = nearestObjects [_object, ["Car", "Tank", "Air", "Ship"], 5];

private _isNearVehicle = _nearestObjects isNotEqualTo [];

[_isNearVehicle, _nearestObjects select 0]
