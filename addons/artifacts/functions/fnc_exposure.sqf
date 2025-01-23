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

[{
    params ["_args","_handle"];

    if !(call EFUNC(radiation,hasArtifact)) exitWith {}; // Early exit until player has an artifact.

//Handle artifact dosage
call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

private _baseDose = 10;
private _skinDeficit = _baseDose * ((1 - _skinProtection) / 1);
private _respiratoryDeficit = _baseDose * ((1 - _respiratoryProtection) / 1);
private _eyeDeficit = _baseDose * ((1 - _eyeProtection) / 1);

//Make sure values don't go below 0 - if protection is higher than 1 this can happen:
if (_skinDeficit < 0) then {_skinDeficit = 0};
if (_respiratoryDeficit < 0) then {_respiratoryDeficit = 0};
if (_eyeDeficit < 0) then {_eyeDeficit = 0};

private _effectiveDose = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

//Only dose player if effective dose is greater than 0 - with enough protection values can turn negative
if (_effectiveDose > 0) then {
[+_effectiveDose, "radiation"] call EFUNC(common,addModifier);
};

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Artifact Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", _skinProtection, _respiratoryProtection, _eyeProtection, "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Artifact Radiation Dose: %1", _effectiveDose]] call EFUNC(common,debugMessage);

}, 10, []] call CBA_fnc_addPerFrameHandler;
