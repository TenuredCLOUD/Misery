#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffeine usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 0: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_caffieneTablets;
 *
*/

params ["_dose", "_value"];

if (isMultiplayer) exitWith {};

private _baseRate = 0.00055 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "energy"] call EFUNC(common,addStatusModifier);



