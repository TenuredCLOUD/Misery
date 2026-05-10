#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antidote pill usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 1: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_antidote;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.001 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "toxicity"] call EFUNC(common,addStatusModifier);
