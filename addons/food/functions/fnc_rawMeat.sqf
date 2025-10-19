#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Raw meat exposure parasite chance
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_food_fnc_rawMeat
 *
*/

if ([EGVAR(survival,meatDiseaseChance)] call EFUNC(common,rollChance)) then {
    [{
        [0.01, "parasites"] call EFUNC(common,addStatusModifier);
    }, [], 60] call CBA_fnc_waitAndExecute;
};
