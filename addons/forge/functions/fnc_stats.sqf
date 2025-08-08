#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Grabs closest forge data
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Closest forge object <OBJECT>
 * 1: Forges fuel <NUMBER>
 *
 * Example:
 * [] call misery_forge_fnc_stats
 *
*/

params ["_object"];

private _nearObjects = nearestObjects [_object, [QCLASS(forge)], 2.5];

[_nearObjects select 0, (_nearObjects select 0) getVariable [QGVAR(fuel), 0]]
