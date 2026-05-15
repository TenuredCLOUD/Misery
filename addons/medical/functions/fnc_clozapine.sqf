#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine pill usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 1: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_clozapine;
 *
*/

params ["_dose", "_value"];

if (!EGVAR(psychosis,enabled)) exitWith {};

private _baseRate = -0.00055 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "psychosis"] call EFUNC(common,addStatusModifier);
