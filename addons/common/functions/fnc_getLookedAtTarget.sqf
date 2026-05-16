#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Performs a short-range raycast from the player's eyes, grabbing the looked at model / object
 * Much cleaner and more efficient than cursorObject due to distance limiting ability
 *
 * Arguments:
 * 0: Distance <NUMBER>
 *
 * Return Value:
 * 0: Object <OBJECT>
 * 1: Intersection Point ASL <ARRAY>
 *
 * Example:
 * [] call misery_common_fnc_getLookedAtTarget
 *
*/

params ["_distance"];

getCameraViewDirection player params ["_vectorA", "_vectorB", "_vectorC"];
eyePos player params ["_eyePosA", "_eyePosB", "_eyePosC"];

private _endPos = [_eyePosA + _vectorA * _distance, _eyePosB + _vectorB * _distance, _eyePosC + _vectorC * _distance];

private _intersections = lineIntersectsSurfaces [[_eyePosA, _eyePosB, _eyePosC], _endPos, player, objNull, true, 1, "GEOM", "NONE"];

if (count _intersections < 1) exitWith {
    [objNull, [0, 0, 0]]
};

private _hitData = _intersections select 0;
private _posASL = _hitData select 0;
private _object = _hitData select 2;

[_object, _posASL]
