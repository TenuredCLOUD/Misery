#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Potassium Iodate usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 0: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_potassiumIodate;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.00011 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "thirst"] call EFUNC(common,addStatusModifier);
