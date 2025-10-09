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

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antiparasitic), 10, 60, -15, 0, -15, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[{
    [-1, "parasites"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;
