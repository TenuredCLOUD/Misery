#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if unit was wearing proper gear when digging up sample
 * Simulates Radioactive dust exposure from digging
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_protectedDig;
 *
 * Public: No
*/

params ["_unit"];

[_unit] call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

private _respiratoryDeficit = (1 - _respiratoryProtection) max 0;
private _skinDeficit = (1 - _skinProtection) max 0;

private _hazardFactor = (_respiratoryDeficit * 2.5) + (_skinDeficit * 1);

if (_hazardFactor > 0) then {
    private _dose = _hazardFactor * 0.12;
    [_dose, "radiation"] call EFUNC(common,addStatusModifier);

    [_unit, "moan", 1] call ACEFUNC(medical_feedback,playInjuredSound);
};
