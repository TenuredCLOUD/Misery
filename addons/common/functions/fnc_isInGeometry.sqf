#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if position is inside geometry
 *
 * Arguments:
 * 0: Position <POSITION>
 *
 * Return Value:
 * 0: In Geometry <BOOL>
 *
 * Example:
 * [] call misery_fnc_common_isInGeometry
*/

params ["_position"];

_position = ATLtoASL _position;

_position params ["_xPos", "_yPos", "_zPos"];

private _altPosition = [_xPos, _yPos, (_zPos + 1)];

private _intersectCheck = lineIntersectsWith [_position, _altPosition];

(_intersectCheck select 0) isKindOf "Building"
