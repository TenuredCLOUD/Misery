#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if object is empty
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Empty object <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_emptyObject
 *
 */

params ["_object"];

(itemCargo _object isEqualTo []) && (magazineCargo _object isEqualTo []) && (weaponCargo _object isEqualTo []) && (backpackCargo _object isEqualTo []) && (everyContainer _object isEqualTo [])
