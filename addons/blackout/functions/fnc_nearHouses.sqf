#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Get all terrain houses
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Terrain Buildings <ARRAY>
 *
 * Example:
 * [] call misery_fnc_blackout_nearHouses
*/

private _axis = worldSize / 2;
private _center = [_axis, _axis, 0];

private _terrainHouses = nearestTerrainObjects [_center, ["HOUSE"], worldSize];

_terrainHouses
