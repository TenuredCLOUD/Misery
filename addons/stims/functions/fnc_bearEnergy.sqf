#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * BearEnergy usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_bearEnergy;
 *
*/

if !(isMultiplayer) then {
    [-0.1, "energy"] call EFUNC(common,addStatusModifier);
};
