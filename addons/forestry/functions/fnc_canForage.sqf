#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Can forage check
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_forage_fnc_canForage
 *
*/

params [["_canForage", false]];

if (!isNull objectParent player) exitWith {};
if (insideBuilding player isEqualTo 1) exitWith {};

private _pos = positionCameraToWorld [0, 0, 0];
private _pos2 = _pos vectorAdd (getCameraViewDirection player vectorMultiply 4);
private _intersects = terrainIntersect [_pos, _pos2];

if (!_intersects) exitWith {};

if (!(((getPosASLW player select 2) < 0) || (underwater player))) then {
    if (count (nearestTerrainObjects [player, ["BUSH"], 2.5, true, true]) > 0) then {
        _canForage = true;
    };
};

_canforage
