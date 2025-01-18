#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Checks if player is nearby a lit fire
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Near Fire <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_nearFire
*/

private _nearestObjects = nearestObjects [player, [MACRO_FIRETYPES], 2.5];

_nearestObjects findIf {inflamed _x} isNotEqualTo -1
