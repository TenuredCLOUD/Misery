#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medicine event logging & Processing utilizing ACE medical API
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
 * [] call misery_medical_fnc_processMedication;
 *
*/

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

if ([_className, "CfgMagazines"] call EFUNC(common,configCheck)) then {
    [_className] call EFUNC(common,itemDecrement);
};

[_patient, [_className] call EFUNC(common,getItemData) select 0] call ACEFUNC(medical_treatment,addToTriageCard);

[_patient, "activity", "%1 used %2", [[_medic, false, true] call ACEFUNC(common,getName), [_className] call EFUNC(common,getItemData) select 0]] call ACEFUNC(medical_treatment,addToLog);

// [QACEGVAR(medical_treatment,medicationLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;

[_className] call FUNC(getMedicationData) params ["_painAdjust", "_timeInSystem", "_timeTillMaxEffect", "_viscosityChange", "_hrIncreaseLow", "_hrIncreaseNormal", "_hrIncreaseHigh", "_incompatibleMedication", "_dose", "_maxDose"];

private _heartRate = _patient getVariable [QACEGVAR(medical,heartRate), 80];

private _hrIncrease = [_hrIncreaseLow, _hrIncreaseNormal, _hrIncreaseHigh] select (floor ((0 max _heartRate min 110) / 55));

_hrIncrease params ["_minIncrease", "_maxIncrease"];

private _heartRateChange = _minIncrease + random (_maxIncrease - _minIncrease);

[_patient, _className, _timeTillMaxEffect, _timeInSystem, _heartRateChange, _painAdjust, _viscosityChange, _dose] call ACEFUNC(medical_status,addMedicationAdjustment);

if (_className in [MACRO_MEDICATION_STRONG]) then {
    [15, 2] call EFUNC(common,chromaticEffect);
    [_patient, _className] call FUNC(withdrawal);
};

