#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if nearby provided crafting station
 *
 * Arguments:
 * 0: Stations <ARRAY>
 * 1: Distance <NUMBER>
 *
 * Return Value:
 * 0: Nearby <BOOL>
 *
 * Example:
 * [[QCLASS(Anvil"], 1.5] call misery_common_fnc_nearCraftingStation
*/

params ["_craftingStations", "_distance"];

// Early exit if in vehicle.
if (!isNull objectParent player) exitWith {};

private _nearObjects = nearestObjects [player, _craftingStations, _distance];

count _nearObjects > 0
