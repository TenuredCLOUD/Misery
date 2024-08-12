#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if position is inside of a house
 *
 * Arguments:
 * 0: Position <POSITION>
 *
 * Return Value:
 * 0: Is Inside <BOOL>
 *
 * Example:
 * [] call misery_fnc_common_isInsideLoot
*/

params ["_position"];

_position = ATLtoASL _position;

lineIntersectsSurfaces [_position, _position vectorAdd [0, 0, 50], nil, nil, nil, nil, "GEOM", "NONE"] select 0 params ["", "", "", "_house"];

_house isKindOf "House"
