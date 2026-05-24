#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Radiation tracker for ACE medical API
 * Used for Radiation exposure to simulate Acute Radiation sickness
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radiation <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handleRadiationEffects;
 *
*/

params ["_unit", "_radiation"];

private _woundSize = round (linearConversion [0.01, 1, _radiation, 0, 2, true]);

private _bruiseCount = round (linearConversion [0.01, 1, _radiation, 1, 4, true]);
private _burnCount   = round (linearConversion [0.5, 1, _radiation, 1, 3, true]);

private _woundDamage = linearConversion [0.01, 1, _radiation, 0.1, 1, false];

if (_radiation >= 0.5) then {
    [_unit, "body", ["ThermalBurn", _burnCount, _woundSize, _woundDamage]] call ACEFUNC(medical,addWound);
};

if (_radiation >= 0.01) then {
    [_unit, "body", ["Contusion", _bruiseCount, _woundSize, _woundDamage]] call ACEFUNC(medical,addWound);
};
