#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles ailment related things for survival loop.
 *
 * Arguments:
 * 0: Damaged <BOOL>
 * 1: Hunger <NUMBER>
 * 2: Thirst <NUMBER>
 * 3: Ailments <ARRAY>
 * 4: Parasites <NUMBER>
 * 5: Toxicity <NUMBER>
 * 6: Infection <NUMBER>
 * 7: Is Multiplayer <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleAilments;
 *
 * Public: No
*/

params ["_damaged", "_hunger", "_thirst", "_ailments", "_parasites", "_toxicity", "_infection", "_isMultiplayer"];

if !(GVAR(ailments)) exitWith {};

// Initial values are checked before comparing, otherwise values will never change.

// Parasites - Always gets worse, reset if medication is used
private _finalParasites = ((_parasites + GVAR(parasiteModifiers)) min 1) max -1;
GVAR(parasiteModifiers) = 0;
player setVariable [QGVAR(parasites), _finalParasites];

if (_parasites > 0) then {
    [0.001, "parasites"] call EFUNC(common,addStatusModifier);
} else {
    player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
};

// Toxicity - Heal if not damaged and well-fed/hydrated, otherwise gets worse
private _finalToxicity = ((_toxicity + GVAR(toxicityModifiers)) min 1) max -1;
GVAR(toxicityModifiers) = 0;
player setVariable [QGVAR(toxicity), _finalToxicity];

switch (true) do {
    case (_toxicity <= 0): {
        player setVariable [QGVAR(toxicity), MACRO_PLAYER_DEFAULTS_LOW];
    };
    case (_damaged || _hunger < 0.75 || _thirst < 0.75 && _toxicity > 0): {
        [0.001, "toxicity"] call EFUNC(common,addStatusModifier);
    };
    case (!_damaged && _hunger >= 0.75 && _thirst >= 0.75 && _toxicity > 0): {
        [-0.001, "toxicity"] call EFUNC(common,addStatusModifier);
    };
};

// Infection - Heal if not damaged and well-fed/hydrated, otherwise gets worse
private _finalInfection = ((_infection + GVAR(infectionModifiers)) min 1) max -1;
GVAR(infectionModifiers) = 0;
player setVariable [QGVAR(infection), _finalInfection];

switch (true) do {
    case (_infection <= 0): {
        player setVariable [QGVAR(infection), MACRO_PLAYER_DEFAULTS_LOW];
    };
    case (_damaged || _hunger < 0.75 || _thirst < 0.75 && _infection > 0): {
        [0.001, "infection"] call EFUNC(common,addStatusModifier);
    };
    case (!_damaged && _hunger >= 0.75 && _thirst >= 0.75 && _infection > 0): {
        [-0.001, "infection"] call EFUNC(common,addStatusModifier);
    };
};

if (_isMultiplayer) exitWith {};

private _isSleeping = player getVariable [QGVAR(isSleeping), false];
private _inhumanlyExhausted = (_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"}) > -1;

if (_inhumanlyExhausted && !(_isSleeping) && random 1 < 0.2) then {
    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [player, true, 5, true] call ace_medical_fnc_setUnconscious;
    } else {
        [player, random 5] call FUNC(setUnconscious);
    };
};

