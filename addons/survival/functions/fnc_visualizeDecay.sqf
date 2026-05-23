#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Visualize health decay
 * Adds ACE medical uncon effect to players vision, based on hunger, thirst, exposure, sickness
 *
 * Arguments:
 * 0: visualize decay <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_visualizeDecay;
 *
*/

params ["_decay"];

private _targetLevel = [0, 8.333333e-4] select _decay;
GVAR(decayLevel) = GVAR(decayLevel) + _targetLevel;

if (GVAR(decayLevel) > 0 && !_decay) then {
    GVAR(decayLevel) = GVAR(decayLevel) - 2.083333e-3;
};

GVAR(decayLevel) = GVAR(decayLevel) max 0 min 1;

private _intensity = GVAR(decayLevel);

// If no visualizer make sure effect doesn't fire (fix for healthy state & effect playing in main menu)
if (!_decay) exitWith {};

if ([5] call EFUNC(common,rollChance)) then {
    [false, 1] call ACEFUNC(medical_feedback,effectUnconscious);
};

if (_decay && _intensity >= 1) then {
    if ([5] call EFUNC(common,rollChance)) then {
        [player] call ACEFUNC(medical_statemachine,enteredStateCardiacArrest);
    };
};
