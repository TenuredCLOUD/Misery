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

private _targetLevel = [0, 3.333333e-3] select _decay; //0.1
GVAR(decayLevel) = GVAR(decayLevel) + _targetLevel;

if (GVAR(decayLevel) > 0 && !_decay) then {
    GVAR(decayLevel) = GVAR(decayLevel) - 8.333333e-3; //0.25
};

GVAR(decayLevel) = GVAR(decayLevel) max 0 min 1;

private _intensity = GVAR(decayLevel);

GVAR(decayEffect) ppEffectEnable (_intensity > 0);
GVAR(decayEffect) ppEffectAdjust [
    1 - _intensity * 0.5,
    1 - _intensity * 0.7,
    0,
    [0, 0, 0, _intensity * 0.5],
    [1, 1, 1, 1 - _intensity],
    [1, 1, 1, 0],
    [0.3 + _intensity * 0.7, 0.5 - _intensity * 0.5, 0, 0, -0.1, 0.4, 0.8 - _intensity * 0.6]
];
GVAR(decayEffect) ppEffectCommit 0.5;

if (_decay && _intensity >= 1) then {
    [player setHitPointDamage ["hitHead", 0.33], [player, 0.33, "head", "unknown", objNull, [], true] call ace_medical_fnc_addDamageToUnit] select ("ace_medical" call EFUNC(common,isModLoaded));
};
