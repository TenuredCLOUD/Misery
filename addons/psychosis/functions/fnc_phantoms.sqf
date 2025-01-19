#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles psychosis near Remnant phantoms
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_phantoms
 *
*/

if (!GVAR(remnant)) exitWith {0};

if ([["myst_phantom_hidden_f", "myst_phantom_naked_f"], 25] call EFUNC(common,nearEntities)) exitWith {
    GVAR(unnaturalIncrease)
};
