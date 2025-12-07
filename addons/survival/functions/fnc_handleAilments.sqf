#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles ailment related things for survival loop.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleAilments;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "", "", "", "", "", "_infection", "_parasites", "_toxicity"];

call EFUNC(common,playerDamaged) params ["_damaged"];

// Parasites - Always gets worse, reset if medication is used
private _finalParasites = ((_parasites + GVAR(parasiteModifiers)) min 1) max -1;
GVAR(parasiteModifiers) = 0;
player setVariable [QGVAR(parasites), _finalParasites];

if (_parasites > 0) then {
    [0.01, "parasites"] call EFUNC(common,addStatusModifier);
};
if (_parasites < 0) then {
    player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
};

// Toxicity - Heal if not damaged and well-fed/hydrated, otherwise gets worse
private _finalToxicity = ((_toxicity + GVAR(toxicityModifiers)) min 1) max -1;
GVAR(toxicityModifiers) = 0;
player setVariable [QGVAR(toxicity), _finalToxicity];

if (_toxicity > 0) then {
    if (_damaged || _hunger < 0.75 || _thirst < 0.75) then {
        [0.01, "toxicity"] call EFUNC(common,addStatusModifier);
    } else {
        [-0.005, "toxicity"] call EFUNC(common,addStatusModifier);
    };
};
if (_toxicity < 0) then {
    player setVariable [QGVAR(toxicity), MACRO_PLAYER_DEFAULTS_LOW];
};

// Infection - Heal if not damaged and well-fed/hydrated, otherwise gets worse
private _finalInfection = ((_infection + GVAR(infectionModifiers)) min 1) max -1;
GVAR(infectionModifiers) = 0;
player setVariable [QGVAR(infection), _finalInfection];

if (_infection > 0) then {
    if (_damaged || _hunger < 0.75 || _thirst < 0.75) then {
        [0.01, "infection"] call EFUNC(common,addStatusModifier);
    } else {
        [-0.005, "infection"] call EFUNC(common,addStatusModifier);
    };
};
if (_infection < 0) then {
    player setVariable [QGVAR(infection), MACRO_PLAYER_DEFAULTS_LOW];
};
