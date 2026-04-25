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

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(thrombomodulin), 120, 300, 1, 0, 1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-0.05, "radiation"] call EFUNC(common,addStatusModifier);
