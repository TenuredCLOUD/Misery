#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Condition for sleep action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Near bed object, or terrainObject, or player is in a ground vehicle <BOOL>
 *
 * Example:
 * [] call misery_sleep_fnc_sleepCondition
 *
*/

private _nearObjects = nearestObjects [player, [MACRO_BEDS], 2.5];

private _nearTerrainObjects = nearestTerrainObjects [player, [MACRO_BEDS], 2.5];

_nearObjects isNotEqualTo [] || _nearTerrainObjects isNotEqualTo [] || vehicle player isKindOf "Car"
