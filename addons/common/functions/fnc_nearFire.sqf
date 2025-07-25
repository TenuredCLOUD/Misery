#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Checks if player is nearby a lit fire & returns fire objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Nearest Fire Objects <ARRAY>
 * 1: Fire is lit <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_nearFire
*/

private _nearestObjects = nearestObjects [player, [MACRO_FIRETYPES], 2.5];

private _isInflamed = _nearestObjects findIf {inflamed _x} isNotEqualTo -1;

[_nearestObjects, _isInflamed]
