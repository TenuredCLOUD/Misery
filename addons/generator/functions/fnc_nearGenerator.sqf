#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Checks for nearby generator objects
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Nearby Generator <BOOL>
 * 1: Nearest Generator <ARRAY>
 * 2: Type of Generator <STRING>
 *
 * Example:
 * [] call misery_generator_fnc_nearGenerator
 *
*/

params ["_object", ["_distance", 2]];

if (!isNull objectParent player) exitWith {};

private _nearObjects = nearestObjects [_object, ["Land_Portable_generator_F", "Land_PowerGenerator_F"], _distance];

[count _nearObjects > 0, _nearObjects select 0, typeOf (_nearObjects select 0)]
