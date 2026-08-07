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

call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "", "", "_exposure", "", "_radiation", "_infection", "_parasites", "_toxicity"];

private _feedBackCompleted = false;

if (_hunger < 0.5) then {
    if ([1] call EFUNC(common,rollChance)) then {
        [ACE_player, "moan", 0] call ACEFUNC(medical_feedback,playInjuredSound);
        if (currentWeapon ACE_player isEqualTo "") then {
            [ACE_player, QEGVAR(animations,hungry)] call ACEFUNC(common,doGesture);
        };
        _feedBackCompleted = true;
    };
};

if (_thirst < 0.5 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        playSound selectRandom [
            QACEGVAR(advanced_fatigue,breathLow0),
            QACEGVAR(advanced_fatigue,breathLow1),
            QACEGVAR(advanced_fatigue,breathLow2),
            QACEGVAR(advanced_fatigue,breathLow3),
            QACEGVAR(advanced_fatigue,breathLow4),
            QACEGVAR(advanced_fatigue,breathLow5)
        ];
        if (currentWeapon ACE_player isEqualTo "") then {
            [ACE_player, QEGVAR(animations,thirsty)] call ACEFUNC(common,doGesture);
        };
        _feedBackCompleted = true;
    };
};

if (_exposure > 0.2 || _exposure < -0.2 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        if (_exposure < -0.2) then {
            addCamShake [1, 5, 10];
        };
        [ACE_player, "moan", 0] call ACEFUNC(medical_feedback,playInjuredSound);
        _feedBackCompleted = true;
    };
};

if (_radiation > 0.025 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        addCamShake [1, 5, 10];
        [ACE_player, "moan", 2] call ACEFUNC(medical_feedback,playInjuredSound);
        _feedBackCompleted = true;
    };
};

if (_infection > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        [ACE_player, "moan", 1] call ACEFUNC(medical_feedback,playInjuredSound);
        _feedBackCompleted = true;
    };
};

if (_parasites > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        addCamShake [1, 5, 10];
        [ACE_player, "moan", 2] call ACEFUNC(medical_feedback,playInjuredSound);
        _feedBackCompleted = true;
    };
};

if (_toxicity > 0 && !_feedBackCompleted) then {
    if ([1] call EFUNC(common,rollChance)) then {
        [ACE_player, "moan", 1] call ACEFUNC(medical_feedback,playInjuredSound);
        _feedBackCompleted = true;
    };
};
