#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * THBD injection (stim) (radiation removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_thbdInjectionStim;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(thrombomodulin_Stimpack), 120, 600, 1, 0, 1, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

[{
    [-0.050, "radiation"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;
