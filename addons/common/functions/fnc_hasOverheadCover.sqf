#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if the object has overhead cover.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Height to Check <NUMBER>
 *
 * Return Value:
 * 0: Has Cover <BOOL>
 *
 * Example:
 * [] call misery_fnc_common_hasOverheadCover
*/

params ["_object", ["_heightCheck", 20], ["_return", false]];

lineIntersectsSurfaces [
    getPosWorld _object,
    getPosWorld _object vectorAdd [0, 0, _heightCheck],
    _object, objNull, true, 1, "GEOM", "NONE"
] select 0 params ["","","","_house"];

if (_house isKindOf "House") then {
    _return = true;
};

_return