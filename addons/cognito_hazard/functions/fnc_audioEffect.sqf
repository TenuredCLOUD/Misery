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

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hearingProtection = ([player] call EFUNC(protection,totalProtection)) select 5;

    enableCamShake true;

    if (_hearingProtection < 1) exitWith {
        15 call ACEFUNC(hearing,earRinging);
        [] call ACEFUNC(medical_feedback,effectIncapacitated);
        playSound QEGVAR(audio,sound_brainScorcher);
        addCamShake [10, 45, 10];
    };

    playSound QEGVAR(audio,sound_submergedShort);
    playSound selectRandom [MACRO_AUDIOSELECTIONS];
}, 16] call CBA_fnc_addPerFrameHandler;
