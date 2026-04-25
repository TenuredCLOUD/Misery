#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antidote injection
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antidote;
 *
*/

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antidote), 60, 10, -10, 0, -10, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-1, "toxicity"] call EFUNC(common,addStatusModifier);
