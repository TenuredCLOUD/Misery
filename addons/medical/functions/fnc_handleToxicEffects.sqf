#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Toxicity tracker for ACE medical API
 * Simulates loss of SpO2 / Aspiration from toxic nerve agents
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Toxicity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handleToxicEffects;
 *
*/

params ["_unit", "_toxicity"];

if (_toxicity < 0.45) exitWith {};
if !([_unit] call ACEFUNC(common,isAwake)) exitWith {};

private _currentTime = CBA_missionTime;

private _nextSoundTime = _unit getVariable [QGVAR(nextToxicEffect), 0];

if (_currentTime < _nextSoundTime) exitWith {};

private _baseDelay = linearConversion [0.1, 1, _toxicity, 25, 6, true];
private _delay = _baseDelay * (0.85 + (random 0.3));

_unit setVariable [QGVAR(nextToxicEffect), _currentTime + _delay];

private _volume = linearConversion [0.1, 1, _toxicity, 0.4, 1, true];

private _chokingAudio = [
    "a3\sounds_f\characters\human-sfx\person1\p1_choke_01.wss",
    "a3\sounds_f\characters\human-sfx\person1\p1_choke_02.wss",
    "a3\sounds_f\characters\human-sfx\person1\p1_choke_03.wss",
    "a3\sounds_f\characters\human-sfx\person1\p1_choke_04.wss"
];

playSoundUI [selectRandom _chokingAudio, _volume, 1];
call ACEFUNC(medical_feedback,effectIncapacitated);
