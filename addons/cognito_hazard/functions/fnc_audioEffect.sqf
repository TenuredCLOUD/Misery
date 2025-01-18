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

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hearingProtection = (call EFUNC(protection,totalProtection)) select 5;

    enableCamShake true;

    if (_hearingProtection < 1) exitWith {
        playSound QEGVAR(audio,sound_brainScorcher);

        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [10];
        "dynamicBlur" ppEffectCommit 3;

        addCamShake [10, 45, 10];
        player setFatigue 1;
        5 fadeSound 0.1;

        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 3;
        "dynamicBlur" ppEffectEnable false;
    };

    addCamShake [1, 5, 10];
    playSound QEGVAR(audio,sound_submergedShort);
    playSound selectRandom [MACRO_AUDIOSELECTIONS];
}, 16] call CBA_fnc_addPerFrameHandler;
