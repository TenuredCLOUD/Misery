#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Health deteriation check
 *
 * Arguments:
 * 0: Hunger <NUMBER>
 * 1: Thirst <NUMBER>
 * 2: Exposure <NUMBER>
 *
 * Return Value:
 * Decay Health <BOOL>
 *
 * Example:
 * [] call misery_survival_fnc_decayHealth;
 *
*/

params ["_hunger", "_thirst", "_exposure"];

private _decayHealth = false;

switch (true) do {
    case (_hunger isEqualTo 0): {
        _decayHealth = true
    };
    case (_thirst isEqualTo 0): {
        _decayHealth = true
    };
    case (_exposure isEqualTo -1): {
        _decayHealth = true
    };
    case (_exposure isEqualTo 1): {
        _decayHealth = true
    };
    default {_decayHealth = false};
};

_decayHealth
