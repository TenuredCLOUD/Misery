#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cleaning loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_cleanCheck;
 *
*/

[] call FUNC(clean);

[{
    [] call FUNC(cleanCheck);
}, [], 30] call CBA_fnc_waitAndExecute;
