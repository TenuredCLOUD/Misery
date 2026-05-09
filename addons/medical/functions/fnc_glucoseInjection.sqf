#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Glucose usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 0: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_glucoseInjection;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.001 * _dose;
private _baseERate = 0.00055 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "hunger"] call EFUNC(common,addStatusModifier);
[_baseERate * _intensity, "energy"] call EFUNC(common,addStatusModifier);
