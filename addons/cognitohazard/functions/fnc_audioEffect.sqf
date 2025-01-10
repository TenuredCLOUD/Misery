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
 * [] call misery_cognitohazard_fnc_audioEffect
*/

[{
    params ["_args", "_handle"];

private _totalProtection = call EFUNC(protection,totalProtection);

private _hearingProtection = _totalProtection select 5;

if (_hearingProtection < 1) then {

            playSound QEGVAR(audio,sound_brainScorcher);

            "dynamicBlur" ppEffectEnable true;
            "dynamicBlur" ppEffectAdjust [10];
            "dynamicBlur" ppEffectCommit 3;
            enableCamShake true;
            addCamShake [10, 45, 10];
            player setFatigue 1;
            5 fadeSound 0.1;

            "dynamicBlur" ppEffectAdjust [20];
            "dynamicBlur" ppEffectCommit 3;
            "dynamicBlur" ppEffectEnable false;
        }else{
            enableCamShake true;
            addCamShake [1, 5, 10];
            playSound QEGVAR(audio,sound_submergedShort);
            playSound selectRandom [
            QEGVAR(audio,sound_distantGhost),
            QEGVAR(audio,sound_distantHellspawn),
            QEGVAR(audio,sound_distantScream01),
            QEGVAR(audio,sound_distantScream02),
            QEGVAR(audio,sound_distantScream03),
            QEGVAR(audio,sound_distantScream04),
            QEGVAR(audio,sound_moan),
            QEGVAR(audio,sound_monsterCall),
            QEGVAR(audio,sound_monsterDistant),
            QEGVAR(audio,sound_monsterScream)];
        };

    private _leftArea = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftArea) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 16] call CBA_fnc_addPerFrameHandler;
