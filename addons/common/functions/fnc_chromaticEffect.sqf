#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Applies chromatic effect to player
 *
 * Arguments:
 * 0: Duration <NUMBER>
 * 1: Commit effect time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [3, 2] call misery_common_fnc_chromaticEffect
*/

params [["_duration", 3], ["_commitTime", 2]];

if (GVAR(chromEffect)) exitWith {};

GVAR(chromEffect) = true;

private _ppeffect = ppEffectCreate ["ChromAberration", 1000];

_ppeffect ppEffectEnable true;
_ppeffect ppEffectAdjust [0.3, 0.3, false];
_ppeffect ppEffectCommit _duration;

[{
    params ["_ppeffect", "_commitTime"];
    _ppeffect ppEffectAdjust [0, 0, false];
    _ppeffect ppEffectCommit _commitTime;

    [{
        params ["_ppeffect"];
        ppEffectDestroy _ppeffect;
        GVAR(chromEffect) = false;
    }, [_ppeffect], _commitTime] call CBA_fnc_waitAndExecute;
}, [_ppeffect, _commitTime], _duration] call CBA_fnc_waitAndExecute;
