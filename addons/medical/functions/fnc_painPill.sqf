#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pain pill usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 1: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_painPill;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.00011 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "hunger"] call EFUNC(common,addStatusModifier);
