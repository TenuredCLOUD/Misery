#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if player can access fire crafting
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_fire_fnc_condition
 *
*/

call EFUNC(common,nearFire) params ["_nearestFire"];

private _hasTinder = [[MACRO_FIRE_TINDER]] call EFUNC(common,hasItem);
private _hasIgnition = [[MACRO_FIRE_IGNITION]] call EFUNC(common,hasItem);

if (_nearestFire isEqualTo [] && _hasTinder && _hasIgnition && isNull objectParent player && insideBuilding player != 1) exitWith {
    true
};

false
