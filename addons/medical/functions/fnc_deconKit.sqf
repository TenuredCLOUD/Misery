#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Decontamination Kit (radiation removal) utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 1: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_deconKit;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.001 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "radiation"] call EFUNC(common,addStatusModifier);
