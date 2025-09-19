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
 * [] call misery_anvil_fnc_nearestForgeStats
 *
*/

params ["_object"];

private _nearObjects = nearestObjects [_object, [QCLASS(forge)], 25];

if (_nearObjects isEqualTo []) exitWith {[objNull, 0]};

[_nearObjects select 0, (_nearObjects select 0) getVariable [QEGVAR(forge,fuel), 0]]
