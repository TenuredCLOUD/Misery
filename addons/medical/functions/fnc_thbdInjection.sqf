#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * THBD injection usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 1: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_thbdInjection;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.00055 * _dose;
private _baseHRate = -0.00055 * _dose;
private _baseTRate = -0.00055 * _dose;
private _basePRate = 0.02 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "radiation"] call EFUNC(common,addStatusModifier);

[_baseHRate * _intensity, "hunger"] call EFUNC(common,addStatusModifier);

[_baseTRate * _intensity, "thirst"] call EFUNC(common,addStatusModifier);

private _painAmount = player getVariable [QACEGVAR(medical,pain), 0];

if (_painAmount <= 0.5) then {
    [player, _basePRate] call ACEFUNC(medical_status,adjustPainLevel);
};
