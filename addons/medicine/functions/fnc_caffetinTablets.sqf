#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffetin tablets usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffetinTablets;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(caffetin), 120, 300, 1, 0, 1, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[{
    [-0.2, "infection"] call EFUNC(common,addStatusModifier);
    [-0.2, "exposure"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;
