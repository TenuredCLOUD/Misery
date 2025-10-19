#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_clozapine;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(clozapineBox), 120, 300, 5, 0, 5, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

if (!EGVAR(psychosis,enabled)) exitWith {};

[-0.1, "psychosis"] call EFUNC(common,addStatusModifier);
