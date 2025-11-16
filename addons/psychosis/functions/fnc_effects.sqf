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
if ([50] call EFUNC(common,rollChance)) then {
    playSound selectRandom [MACRO_PSYCHOSIS_SOUNDS];
};

if (_psychosisLevel < 0.25) exitWith {};

if ([5] call EFUNC(common,rollChance) && GVAR(textEnabled)) then {
    private _text = GVAR(randomTextLines) select (_psychosisLevel > 0.5);
    [QEGVAR(common,titleText), [selectRandom _text]] call CBA_fnc_localEvent;
};

if (_psychosisLevel < 0.55) exitWith {
    if (GVAR(sleepBlocked)) then {
        GVAR(sleepBlocked) = false;
    };
};

GVAR(sleepBlocked) = true;

if ([50] call EFUNC(common,rollChance)) then {
    enableCamShake true;
    addCamShake [2, GVAR(cycleTimer), 2];
};

if (_psychosisLevel < 0.75) exitWith {
    if (GVAR(terrifiedState)) then {
        GVAR(terrifiedState) = false;
    };
};

GVAR(terrifiedState) = true;
