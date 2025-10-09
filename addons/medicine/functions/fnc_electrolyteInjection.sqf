#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Electrolyte injection usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_electrolyteInjection;
 *
*/

[{
    [0.5, "thirst"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;
