#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Potassium Iodate pill usage (radiation removal)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_potassiumIodate;
 *
*/

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(potassiumIodate), 120, 300, 1, 0, 1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-0.02, "radiation"] call EFUNC(common,addStatusModifier);
