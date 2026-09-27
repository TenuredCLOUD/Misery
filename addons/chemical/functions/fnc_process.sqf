#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside chemical area.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_process
*/

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    private _leftArea = GVAR(areasCached) findIf {ACE_player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        ACE_player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
        [{
            QGVAR(display) cutText ["", "PLAIN"];
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    [ACE_player] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

    private _skinDeficit = (1 * ((1 - _skinProtection) ^ 1.5)) max 0;
    private _respiratoryDeficit = (1 * ((1 - _respiratoryProtection) ^ 1.5)) max 0;
    private _eyeDeficit = (1 * ((1 - _eyeProtection) ^ 1.5)) max 0;

    private _randomPartAce = ["head", "body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];

    private _fatigueValue = [getFatigue ACE_player, ACE_player getVariable [QACEGVAR(advanced_fatigue,aimFatigue), 0]] select (!isNil QACEGVAR(advanced_fatigue,enabled) && {ACEGVAR(advanced_fatigue,enabled)});

    private _toxResistance = 1;
    private _activeMeds = [ACE_player, false] call ACEFUNC(medical_status,getAllMedicationCount);

    {
        _x params ["_className", "_dose", "_effectiveness"];

        if (_className isEqualTo QCLASS(deconKit)) then {
            private _bufferDK = linearConversion [0, 1, _effectiveness, 1, 0.6, true];
            _toxResistance = _toxResistance * _bufferDK;
        };
    } forEach _activeMeds;

    if (_skinProtection < 1) then {
        private _skinWoundSize = round (linearConversion [0.05, 1, _skinDeficit, 0, 1, true]);
        private _skinBurnCount = round (linearConversion [0.05, 1, _skinDeficit, 1, 2, true]);
        private _skinWoundDamage = linearConversion [0.05, 1, _skinDeficit, 0.001, 0.008, true];

        [ACE_player, selectRandom _randomPartAce, ["ThermalBurn", _skinBurnCount, _skinWoundSize, _skinWoundDamage]] call ACEFUNC(medical,addWound);

        private _skinToxicityRate = (_skinDeficit * 0.005) * _toxResistance;

        [_skinToxicityRate, "toxicity"] call EFUNC(common,addStatusModifier);
    };

    if (_respiratoryProtection < 1) then {

        private _respiratoryToxicityRate = [_respiratoryDeficit, _respiratoryDeficit * 0.002] select (_respiratoryProtection >= 0.5);

        [_respiratoryToxicityRate, "toxicity"] call EFUNC(common,addStatusModifier);

        if (_respiratoryProtection < 0.5) then {
            call ACEFUNC(medical_feedback,effectIncapacitated);
            [ACE_player, "hit", 2] call ACEFUNC(medical_feedback,playInjuredSound);

            if (!isNil QACEGVAR(advanced_fatigue,enabled) && {ACEGVAR(advanced_fatigue,enabled)}) then {
                ACE_player setVariable [QACEGVAR(advanced_fatigue,aimFatigue), _fatigueValue + 0.05];
            } else {
                ACE_player setFatigue (_fatigueValue + 0.05);
            };
        };
    };

    if (_eyeProtection < 1) then {
        private _eyeWoundSize = round (linearConversion [0.05, 1, _eyeDeficit, 0, 1, true]);

        private _eyeBurnCount = round (linearConversion [0.05, 1, _eyeDeficit, 1, 2, true]);

        private _eyeWoundDamage = linearConversion [0.05, 1, _eyeDeficit, 0.01, 0.08, true];

        [ACE_player, "head", ["ThermalBurn", _eyeBurnCount, _eyeWoundSize, _eyeWoundDamage]] call ACEFUNC(medical,addWound);

        QGVAR(display) cutRsc [QCLASS(bloodshot_ui), "PLAIN", 1, false];
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Chemical Area Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"]] call EFUNC(common,debugMessage);
}, 1] call CBA_fnc_addPerFrameHandler;
