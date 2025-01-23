#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * artifact radiation exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_exposure;
 *
*/

#define MACRO_BASE_DOSE 10

[{
    params ["_args", "_handle"];

    if !(call EFUNC(radiation,hasArtifact)) exitWith {}; // Early exit until player has an artifact.

    // Handle artifact dosage
    call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

    private _skinDeficit = MACRO_BASE_DOSE * ((1 - _skinProtection) / 1);
    private _respiratoryDeficit = MACRO_BASE_DOSE * ((1 - _respiratoryProtection) / 1);
    private _eyeDeficit = MACRO_BASE_DOSE * ((1 - _eyeProtection) / 1);
    private _effectiveDose = (_skinDeficit + _respiratoryDeficit + _eyeDeficit) max 0; // with enough protection values can turn negative

    [_effectiveDose, "radiation"] call EFUNC(common,addModifier);

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Artifact Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", _skinProtection, _respiratoryProtection, _eyeProtection, "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Artifact Radiation Dose: %1", _effectiveDose]] call EFUNC(common,debugMessage);
}, 10, []] call CBA_fnc_addPerFrameHandler;
