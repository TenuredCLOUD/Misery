#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if any provided entities are nearby.
 *
 * Arguments:
 * 0: Entities <ARRAY>
 * 1: Distance <NUMBER>
 *
 * Return Value:
 * 0: Nearby <BOOL>
 *
 * Example:
 * [["zombie"], 5] call misery_common_fnc_nearEntities
*/

params ["_entities", "_distance"];

private _nearEntities = player nearEntities [_entities, _distance];

_nearEntities isNotEqualTo []
