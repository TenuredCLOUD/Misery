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

if (!hasInterface) exitWith {};

titleText ["You inject the Clozapine...", "PLAIN DOWN"];

player removeItem QCLASS(clozapineBox);

if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(clozapineBox), 120, 300, 5, 0, 5, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

if (!EGVAR(psychosis,enabled)) exitWith {};

[{
    [-0.25, "psychosis"] call EFUNC(common,addStatusModifier);
}, [], 60] call CBA_fnc_waitAndExecute;
