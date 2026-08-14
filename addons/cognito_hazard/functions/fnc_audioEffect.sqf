#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside cognitohazard area, runs audio samples.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cognito_hazard_fnc_audioEffect
*/

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    private _leftArea = GVAR(areasCached) findIf {ACE_player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _baseProtection = ([ACE_player] call EFUNC(protection,totalProtection)) select 5;
    private _hasEHP = ACE_player getVariable [QCLASSACE(hasEHP), false];
    private _hasEarPlugs = ACE_player getVariable [QCLASSACE(hasEarPlugsIn), false];
    private _hasSHP = ACE_player getVariable [QGVAR(hasSHP), false];

    private _calculatedProtection = _baseProtection;

    if (_hasEHP) then {
        _calculatedProtection = _calculatedProtection + 0.35;
    };

    // Only give earplugs a bonus if hearing protection is worn over them
    if (_hasEarPlugs && {(_baseProtection > 0.3 || _hasEHP)}) then {
        _calculatedProtection = _calculatedProtection + 0.15;
    };

    enableCamShake true;

    if (_hasSHP || {_calculatedProtection >= 0.85}) exitWith {
        playSound QEGVAR(audio,sound_submergedShort);
        playSound selectRandom [MACRO_AUDIOSELECTIONS];
    };

    if (_calculatedProtection >= 0.75) exitWith {
        5 call ACEFUNC(hearing,earRinging);
        addCamShake [4, 15, 5];
        playSound QEGVAR(audio,sound_submergedShort);
        playSound selectRandom [MACRO_AUDIOSELECTIONS];
    };

    15 call ACEFUNC(hearing,earRinging);
    [] call ACEFUNC(medical_feedback,effectIncapacitated);
    playSound QEGVAR(audio,sound_brainScorcher);
    addCamShake [10, 45, 10];

}, 16] call CBA_fnc_addPerFrameHandler;
