#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Environment Evaluator
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * 0: Envionment Type <STRING>
 *
 * Example:
 * [] call misery_common_fnc_evaluateEnvironment;
 *
 * Public: No
*/

params [["_position", [0, 0, 0], [[]], 3]];

private _forestSample = selectBestPlaces [_position, 150, "forest + trees", 10, 5];

private _forestWeight = if (_forestSample isEqualTo []) then { 0 } else { (_forestSample select 0) select 1 };

private _closestBuilding = nearestBuilding _position;

private _distanceToBuilding = if (isNull _closestBuilding) then { 9999 } else { _position distance _closestBuilding };

private _areaType = switch (true) do {
    // If a building is within 120 meters, consider it an urban zone
    case (_distanceToBuilding < 120): { "URBAN" };

    // If no buildings are close and the tree canopy signature is dense
    case (_forestWeight > 0.45): { "WOODS" };

    // Open fields, barren valleys, plains, and fields fallback here
    default { "WILDERNESS" };
};

_areaType
