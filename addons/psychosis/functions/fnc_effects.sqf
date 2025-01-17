#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Adds effects from psychosis, random sounds is the first stage, feeling is the second and cam shake happening at higher levels.
 *
 * Arguments:
 * 0: Psychosis Level <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_psychosis_fnc_effects
 *
*/

params ["_psychosisLevel"];

if (_psychosisLevel < 0.1) exitWith {};

[QUOTE(COMPONENT_BEAUTIFIED), format ["Effects happening at psychosis level of %1", _psychosisLevel]] call EFUNC(common,debugMessage);

// 50% of random sounds, random text and random shaking.
if (0.5 > random 1) then {
    playSound selectRandom [MACRO_PSYCHOSIS_SOUNDS];
};

if (_psychosisLevel < 0.25) exitWith {};

if (0.5 > random 1) then {
    private _text = GVAR(randomTextLines) select (_psychosisLevel > 0.5);
    titleText [selectRandom _text, "PLAIN DOWN"];
};

if (_psychosisLevel < 0.55) exitWith {
    if (GVAR(sleepBlocked)) then {
        GVAR(sleepBlocked) = false;
    };
};

GVAR(sleepBlocked) = true;

if (0.5 > random 1) then {
    enableCamShake true;
    addCamShake [1, GVAR(cycleTimer), 2];
};
