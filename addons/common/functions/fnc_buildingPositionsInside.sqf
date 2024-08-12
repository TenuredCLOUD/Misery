#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Gets building positions with a roof overhead
 *
 * Arguments:
 * 0: Building <OBJECT>
 *
 * Return Value:
 * 0: Positions within Building <ARRAY>
 *
 * Example:
 * [] call misery_fnc_common_buildingPositionsInside
*/

params ["_building"];

private _positions = _building call EFUNC(common,buildingPositions);

{
    if !(_x call FUNC(isInsideLoot)) then {
        _positions = _positions - [_x];
    };
} forEach _positions;

_positions
