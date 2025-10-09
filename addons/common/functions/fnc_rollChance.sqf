#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Simulated dice roll logic (RNG)
 *
 * Arguments:
 * 0: Chance <NUMBER>
 *
 * Return Value:
 * 0: Success <BOOL>
 *
 * Example:
 * [50] call misery_common_fnc_rollChance;
 *
*/

params [["_chance", 0, [0]]];

private _clampedChance = 0 max _chance min 100;

private _roll = random 100;

_roll <= _clampedChance
