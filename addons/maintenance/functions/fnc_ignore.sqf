#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance ignore
 * Used for scripted vehicle events, for example Supply drops
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_ignore;
 *
 * Public: No
*/

params ["_vehicle"];

private _hitPoints = getAllHitPointsDamage _vehicle select 0;

// Repair to 100%
{
    _vehicle setHitPointDamage [_x, 0];
} forEach _hitPoints;

// Set fuel to 100%
_vehicle setFuel 1;

// Strip maintenance variables
_vehicle setVariable [QGVAR(batteryCount), nil, true];
_vehicle setVariable [QGVAR(batteryType), nil, true];
_vehicle setVariable [QGVAR(installedBatteries), nil, true];
_vehicle setVariable [QGVAR(batteryLevel), nil, true];
_vehicle setVariable [QGVAR(oilLevel), nil, true];
_vehicle setVariable [QGVAR(coolantLevel), nil, true];

_vehicle setVariable [QGVAR(ignore), true, true];
