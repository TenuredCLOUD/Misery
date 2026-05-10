#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medication data grab utilizing ACE medical API
 *
 * Arguments:
 * 0: Medication <STRING>
 *
 * Return Value:
 * 0: Pain Reduce <NUMBER>
 * 1: Time In System <NUMBER>
 * 2: Time Till Max Effect <NUMBER>
 * 3: Viscosity Change <NUMBER>
 * 4: hrIncreaseLow <ARRAY>
 * 5: hrIncreaseNormal <ARRAY>
 * 6: hrIncreaseHigh <ARRAY>
 * 7: Incompatible Medication <ARRAY>
 * 8: Dose <NUMBER>
 * 9: Max Dose <NUMBER>
 *
 * Example:
 * ["misery_cocaine"] call misery_medical_fnc_getMedicationData;
 *
*/

params ["_medication"];

private _medicationConfig = configFile >> QUOTE(ace_medical_treatment) >> QUOTE(Medication) >> _medication;

private _painAdjust = getNumber (_medicationConfig >> "painReduce");
private _timeInSystem = getNumber (_medicationConfig >> "timeInSystem");
private _timeTillMaxEffect = getNumber (_medicationConfig >> "timeTillMaxEffect");
private _viscosityChange = getNumber (_medicationConfig >> "viscosityChange");
private _hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow");
private _hrIncreaseNormal = getArray (_medicationConfig >> "hrIncreaseNormal");
private _hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh");
private _incompatibleMedication = getArray (_medicationConfig >> "incompatibleMedication");
private _dose = getNumber (_medicationConfig >> "dose");
private _maxDose = getNumber (_medicationConfig >> "maxDose");

[_painAdjust , _timeInSystem, _timeTillMaxEffect, _viscosityChange, _hrIncreaseLow, _hrIncreaseNormal, _hrIncreaseHigh, _incompatibleMedication, _dose, _maxDose]


