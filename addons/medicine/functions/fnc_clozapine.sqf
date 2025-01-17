#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_clozapine;
 *
*/

if (!hasInterface) exitWith {};

if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

titleText ["You take a clozapine pill...", "PLAIN DOWN"];

player removeItem QCLASS(clozapineBox);

if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(clozapineBox), 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

if (!EGVAR(psychosis,enabled)) exitWith {};

[{
    [-0.1] call EFUNC(psychosis,addModifier);
}, [], 60] call CBA_fnc_waitAndExecute;
