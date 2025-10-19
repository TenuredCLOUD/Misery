#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antibiotic pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antibiotic;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antibiotic), 10, 60, -10, 0, -10, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[-1, "infection"] call EFUNC(common,addStatusModifier);
