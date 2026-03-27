#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Feedback for overall player status
 * Pain, stomach rumbling, etc...
 * Only one feedback will play each survival loop if RNG allows it so effects aren't stacked
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_feedback;
 *
*/

if (!EGVAR(audio,enhancedCharacterEffects)) exitWith {};

call EFUNC(common,getPlayerVariables) params ["_hunger", "", "", "", "_exposure", "", "_radiation", "_infection", "_parasites", "_toxicity"];

private _feedBackCompleted = false;

if (_hunger < 0.75) then {
    if ([1] call EFUNC(common,rollChance)) then {
        playSound selectRandom [MACRO_SURVIVAL_PAIN_HUNGER];
        _feedBackCompleted = true;
    };
};

if (_exposure > 0.025 || _exposure < -0.025 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        if (_exposure < -0.025) then {
            addCamShake [1, 5, 10];
        };
        playSound selectRandom [MACRO_SURVIVAL_PAIN_LOW];
        _feedBackCompleted = true;
    };
};

if (_radiation > 0.025 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        addCamShake [1, 5, 10];
        playSound selectRandom [MACRO_SURVIVAL_PAIN_RADIATION];
        _feedBackCompleted = true;
    };
};

if (_infection > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        playSound selectRandom [MACRO_SURVIVAL_PAIN_MID];
        _feedBackCompleted = true;
    };
};

if (_parasites > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        addCamShake [1, 5, 10];
        playSound selectRandom [MACRO_SURVIVAL_PAIN_MAX];
        _feedBackCompleted = true;
    };
};

if (_toxicity > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        playSound selectRandom [MACRO_SURVIVAL_PAIN_MID];
        _feedBackCompleted = true;
    };
};
