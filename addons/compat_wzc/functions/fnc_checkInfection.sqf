#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks player infection level in a loop for zombification if infection enabled
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_checkInfection;
 *
*/

[] call FUNC(convertToZombie);

[{
    [] call FUNC(checkInfection);
}, [], 15] call CBA_fnc_waitAndExecute;
