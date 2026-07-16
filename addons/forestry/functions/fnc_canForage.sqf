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

private _canForage = false;

if (!isNull objectParent ACE_player) exitWith {false};
if (insideBuilding ACE_player isEqualTo 1) exitWith {false};

private _pos = positionCameraToWorld [0, 0, 0];
private _pos2 = _pos vectorAdd (getCameraViewDirection ACE_player vectorMultiply 4);
private _intersects = terrainIntersect [_pos, _pos2];

if (!_intersects) exitWith {false};

if (!(((getPosASLW ACE_player select 2) < 0) || (underwater ACE_player))) then {
    if (([ACE_player] call EFUNC(common,nearTree)) select 0) then {
        _canForage = true;
    };
};

_canForage
