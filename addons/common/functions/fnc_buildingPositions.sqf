#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Gets building positions
 *
 * Arguments:
 * 0: Building <OBJECT>
 *
 * Return Value:
 * 0: Positions within Building <ARRAY>
 *
 * Example:
 * [] call misery_common_fnc_buildingPositions
*/

params ["_building"];

private _positions = _building call BIS_fnc_buildingPositions;

{
    if (_x call FUNC(isInGeometry)) then {
        _positions = _positions - [_x];
    };
} forEach _positions;

_positions
