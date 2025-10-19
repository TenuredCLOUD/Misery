#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * THBD injection (non-stim) (radiation removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_thbdInjection;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(thrombomodulin), 120, 300, 1, 0, 1, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[-0.05, "radiation"] call EFUNC(common,addStatusModifier);
