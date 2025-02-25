#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles ailment related things for survival loop.
 *
 * Arguments:
 * 0: Ailments <ARRAY>
 * 1: Parasites <NUMBER>
 * 2: Toxicity <NUMBER>
 * 3: Infection <NUMBER>
 * 4: Is Multiplayer <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleAilments;
 *
 * Public: No
*/

params ["_ailments", "_parasites", "_toxicity", "_infection", "_isMultiplayer"];

if !(GVAR(ailments)) exitWith {};

if (_toxicity > 0) then {
    [-0.001, "toxicity"] call EFUNC(common,addStatusModifier);
    private _finalToxicity = ((_toxicity + GVAR(toxicityModifiers)) min 1) max 0;
    player setVariable [QGVAR(toxicity), _finalToxicity];

    if (_finalToxicity == 1) then {
        [player, (_toxicity / 100)] call EFUNC(common,specialDamage);
    };
};

if (_infection > 0) then {
    [-0.001, "infection"] call EFUNC(common,addStatusModifier);
    private _finalInfection = ((_infection + GVAR(infectionModifiers)) min 1) max 0;
    player setVariable [QGVAR(infection), _finalInfection];

    if (_finalInfection == 1) then {
        [player, (_infection / 100)] call EFUNC(common,specialDamage);
    };
};

if (_isMultiplayer) exitWith {};

private _isSleeping = player getVariable [QGVAR(isSleeping), false];
private _inhumanlyExhausted = (_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"}) > -1;

if (_inhumanlyExhausted && !(_isSleeping) && (random 100) < 25) then {
    if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
        [player, true, 5, true] call ace_medical_fnc_setUnconscious;
    } else {
        [player, random 4] call EFUNC(common,stun);
    };
};
