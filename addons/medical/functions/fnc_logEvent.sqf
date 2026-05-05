#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medicine event logging utilizing ACE medical API
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
 * [] call misery_medical_fnc_logEvent;
 *
*/

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

if ([_className, "CfgMagazines"] call EFUNC(common,configCheck)) then {
    [_className] call EFUNC(common,itemDecrement);
};

[_patient, [_className] call EFUNC(common,getItemData) select 0] call ACEFUNC(medical_treatment,addToTriageCard);

[_patient, "activity", "%1 used %2", [[_medic, false, true] call ACEFUNC(common,getName), [_className] call EFUNC(common,getItemData) select 0]] call ACEFUNC(medical_treatment,addToLog);

[QACEGVAR(medical_treatment,medicationLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
