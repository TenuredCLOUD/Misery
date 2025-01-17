#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles psychosis near Ravage Zombies.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_zombies
 *
*/

if (!GVAR(ravage)) exitWith {0};

if ([["zombie"], 25] call EFUNC(common,nearEntities)) exitWith {
    GVAR(unnaturalIncrease)
};

0
