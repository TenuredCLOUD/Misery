#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine injection usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_clozapineInjection;
 *
*/

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(clozapineBox), 120, 300, 5, 0, 5, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

if (!EGVAR(psychosis,enabled)) exitWith {};

[-0.5, "psychosis"] call EFUNC(common,addStatusModifier);
