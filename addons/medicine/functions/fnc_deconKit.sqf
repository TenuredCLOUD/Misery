#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Decontamination Kit (radiation removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_deconKit;
 *
*/

[{
    [-1, "radiation"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;
