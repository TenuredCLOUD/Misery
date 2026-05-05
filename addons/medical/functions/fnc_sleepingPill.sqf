#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * sleep pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_sleepingPill;
 *
*/

if (isMultiplayer) exitWith {};

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(sleepingPills), 10, 60, -10, 0, -10, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[1, "energy"] call EFUNC(common,addStatusModifier);
