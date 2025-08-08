#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Visualize health decay
 * Slowly adds black tunnel vision effect to players vision, based on hunger, thirst, exposure
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

if !(_decay) exitWith {
    GVAR(decayLevel) = 0;
    GVAR(decayEffect) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0.299, 0.587, 0.114, 0], [0, 0, 0, 0, 0, 0, 1]];
    GVAR(decayEffect) ppEffectCommit 5;
    GVAR(decayEffect) ppEffectEnable false;
};

GVAR(decayLevel) = (GVAR(decayLevel) + 0.1) min 1;
private _intensity = GVAR(decayLevel);

GVAR(decayEffect) ppEffectEnable true;
GVAR(decayEffect) ppEffectAdjust [
    1 - _intensity * 0.5,
    1 - _intensity * 0.7,
    0,
    [0, 0, 0, _intensity * 0.5],
    [1, 1, 1, 1 - _intensity],
    [1, 1, 1, 0],
    [0.3 + _intensity * 0.7, 0.5 - _intensity * 0.5, 0, 0, -0.1, 0.4, 0.8 - _intensity * 0.6]
];

GVAR(decayEffect) ppEffectCommit 5;

if (_intensity >= 1) then {
    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [player, 1, "head", "unknown", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
    } else {
        player setDamage 1;
    };
};
