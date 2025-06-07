#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Health deterioration check from ailments
 *
 * Arguments:
 * 0: Radiation <NUMBER>
 * 1: Infection <NUMBER>
 * 2: Parasites <NUMBER>
 * 3: Toxicity <NUMBER>
 * 4: Psychosis <NUMBER>
 *
 * Return Value:
 * Decay Health <BOOL>
 *
 * Example:
 * [] call misery_survival_fnc_ailmentDecay;
 *
*/

params ["_radiation", "_infection", "_parasites", "_toxicity", "_psychosis"];

if (_radiation > 0.25) then {
    [player, _radiation / 5, "body"] call FUNC(ailmentDamage);
};

if (_infection isEqualTo 1) then {
    [player, 1 / 6.5, "body"] call FUNC(ailmentDamage);
};

if (_parasites isEqualTo 1) then {
    [player, 1 / 6.5, "body"] call FUNC(ailmentDamage);
};

if (_toxicity > 0.25) then {
    [player, _toxicity / 5, "body"] call FUNC(ailmentDamage);
};

if (_psychosis isEqualTo 1) then {
    [player, 1 / 8, "head"] call FUNC(ailmentDamage);
};

