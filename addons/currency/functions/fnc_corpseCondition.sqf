#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Confirmation of the currently targeted object is a man, dead and not too far away.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Corpse <OBJECT>
 *
 * Example:
 * [] call misery_currency_fnc_corpseCondition;
 *
*/

private _target = cursorTarget;

if (alive _target || !(_target isKindOf "CAManBase") || player distance _target > 2) exitWith {objNull};

_target
