#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if object is nearby a building and returns nearest building or an array of buildings
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Radius <NUMBER>
 *
 * Return Value:
 * 0: Near Building <BOOL>
 * 1: Nearest Building <OBJECT>
 * 2: All Nearest Buildings <ARRAY>
 *
 * Example:
 * [] call misery_common_fnc_nearBuilding
*/
params ["_object", "_radius"];

private _nearestObjects = nearestObjects [_object, [MACRO_BUILDINGTYPES], _radius, true];

private _isNearBuilding = _nearestObjects isNotEqualTo [];

[_isNearBuilding, _nearestObjects select 0, _nearestObjects]
