#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Random Medication usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Dose amount <NUMBER>
 * 0: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_randomPharm;
 *
*/

params ["_dose", "_value"];

private _baseRate = -0.00055 * _dose;
private _baseTRate = 0.00011 * _dose;
private _intensity = linearConversion [0, 1, _value, 0, 1, false];

[_baseRate * _intensity, "thirst"] call EFUNC(common,addStatusModifier);

[_baseRate * _intensity, "thirst"] call EFUNC(common,addStatusModifier);
[_baseRate * _intensity, "hunger"] call EFUNC(common,addStatusModifier);
[_baseTRate * _intensity, "toxicity"] call EFUNC(common,addStatusModifier);

if ([0.5] call EFUNC(common,rollChance)) then {
    [player, true, 5, true] call ACEFUNC(medical,setUnconscious);
};
