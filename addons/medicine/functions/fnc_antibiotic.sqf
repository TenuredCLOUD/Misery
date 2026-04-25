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

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antibiotic), 10, 60, -10, 0, -10, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-1, "infection"] call EFUNC(common,addStatusModifier);
