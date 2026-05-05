#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffetin tablets usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffetinTablets;
 *
*/

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(caffetin), 120, 300, 1, 0, 1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-0.2, "infection"] call EFUNC(common,addStatusModifier);
[-0.2, "exposure"] call EFUNC(common,addStatusModifier);
