#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Health deterioration check from ailments
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_ailmentDecay;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis"];

if (_radiation > 0.025) then {
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
    if ([15] call EFUNC(common,rollChance)) then {
        [player, 1 / 8, "head"] call FUNC(ailmentDamage);
    };
};

