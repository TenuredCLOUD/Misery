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

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(thrombomodulin_Stimpack), 120, 600, 1, 0, 1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-0.1, "radiation"] call EFUNC(common,addStatusModifier);
