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

[{call EFUNC(radiation,hasArtifact)},
{
[{
        params ["_args","_handle"];

        if (!(call EFUNC(radiation,hasArtifact)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle terminated..."};
            [] call FUNC(exposure);
            if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle checks re-initiated..."};
        };

//Handle artifact dosage
private _totalProtection = call EFUNC(protection,totalProtection);

private _skinProtection = _totalProtection select 2;
private _respiratoryProtection = _totalProtection select 3;
private _eyeProtection = _totalProtection select 4;

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

if (EGVAR(common,debug)) then {
    systemChat format ["Artifact Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"];
    systemChat format ["Effective Artifact Radiation Dose: %1", _effectiveDose];
};

if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
