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

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(antidote), 60, 10, -10, 0, -10, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[-1, "toxicity"] call EFUNC(common,addStatusModifier);
