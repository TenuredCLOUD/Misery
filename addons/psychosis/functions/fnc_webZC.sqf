#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles psychosis near WebKnight Zombies and Creatures.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_webZC
 *
*/

if (!GVAR(webZC)) exitWith {0};

if ([[MACRO_PSYCHOSIS_WEBZC], 25] call EFUNC(common,nearEntities)) exitWith {
    GVAR(unnaturalIncrease)
};

0
