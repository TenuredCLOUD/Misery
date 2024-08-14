#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Get all terrain buildings to switch lights.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Terrain Objects <ARRAY>
 *
 * Example:
 * [] call misery_fnc_blackout_nearObjects
*/

private _axis = worldSize / 2;
private _center = [_axis, _axis, 0];

private _terrainObjects = _center nearObjects ["All", worldSize];

_terrainObjects
