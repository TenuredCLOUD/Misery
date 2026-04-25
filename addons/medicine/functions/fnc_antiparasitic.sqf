#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antiparasitic pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antiparasitic;
 *
*/

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antiparasitic), 10, 60, -15, 0, -15, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-1, "parasites"] call EFUNC(common,addStatusModifier);
