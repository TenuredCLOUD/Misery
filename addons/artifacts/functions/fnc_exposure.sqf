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
    params ["_args", "_handle"];

    if !(call EFUNC(radiation,hasArtifact)) exitWith {}; // Early exit until player has an artifact.

    // Handle artifact dosage
    [player] call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

    private _skinDeficit = 1 * ((1 - _skinProtection) / 1) max 0;
    private _respiratoryDeficit = 1 * ((1 - _respiratoryProtection) / 1) max 0;
    private _eyeDeficit = 1 * ((1 - _eyeProtection) / 1) max 0;
    private _totalDeficit = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

    private _radResistance = 1.0;
    private _activeMeds = [player, false] call ACEFUNC(medical_status,getAllMedicationCount);

    {
        _x params ["_className", "_dose", "_effectiveness"];

        if (_className isEqualTo QCLASS(potassiumIodate)) then {
            private _bufferPI = linearConversion [0, 1, _effectiveness, 1.0, 0.2, true];
            _radResistance = _radResistance * _bufferPI;
        };

        if (_className isEqualTo QCLASS(deconKit)) then {
            private _bufferDK = linearConversion [0, 1, _effectiveness, 1.0, 0.6, true];
            _radResistance = _radResistance * _bufferDK;
        };
    } forEach _activeMeds;

    private _effectiveDose = linearConversion [0, 3, _totalDeficit, 0, 0.01, true];

    private _totalDose = _effectiveDose * _radResistance;

    //Only damage player if exposure is greater than 0 - with enough protection values can turn negative, also reduce damage recieved to player
    if (_totalDose > 0) then {
        [_totalDose, "radiation"] call EFUNC(common,addStatusModifier);
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Artifact Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", _skinProtection, _respiratoryProtection, _eyeProtection, "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Artifact Radiation Dose: %1", _totalDose]] call EFUNC(common,debugMessage);
}, 10, []] call CBA_fnc_addPerFrameHandler;
