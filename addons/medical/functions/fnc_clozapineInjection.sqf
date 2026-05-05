#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine injection usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_clozapineInjection;
 *
*/

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

[_className] call EFUNC(common,itemDecrement);

[_patient, [_className] call EFUNC(common,getItemData) select 0] call ACEFUNC(medical_treatment,addToTriageCard);

[_patient, "activity", "%1 injected %2", [[_medic, false, true] call ACEFUNC(common,getName), [_className] call EFUNC(common,getItemData) select 0]] call ACEFUNC(medical_treatment,addToLog);

if (!EGVAR(psychosis,enabled)) exitWith {};

[-0.5, "psychosis"] call EFUNC(common,addStatusModifier);
