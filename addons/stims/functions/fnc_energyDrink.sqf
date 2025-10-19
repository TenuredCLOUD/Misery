#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Energy drink usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_energyDrink;
 *
*/

if !(isMultiplayer) then {
    [-0.1, "energy"] call EFUNC(common,addStatusModifier);
};
