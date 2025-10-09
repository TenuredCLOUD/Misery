#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Brewed Coffee usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_coffee;
 *
*/

if !(isMultiplayer) then {
    [-0.1, "energy"] call EFUNC(common,addStatusModifier);
};
