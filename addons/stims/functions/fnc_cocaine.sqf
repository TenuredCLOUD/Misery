#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cocaine usage utilizing ACE medical API
 *
 * Arguments:
 * 0: Effectiviness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_cocaine;
 *
*/

params ["_value"];

if (_value > 0.2) then {

    if !(isMultiplayer) then {
        [-0.002, "energy"] call EFUNC(common,addStatusModifier);
    };

    [0.001, "hunger"] call EFUNC(common,addStatusModifier);
};

// Simulated withdrawal symptoms, energy & hunger crash with tremors
if (_value < 0.2) then {

    if !(isMultiplayer) then {
        [0.0015, "energy"] call EFUNC(common,addStatusModifier);
    };

    [-0.0012, "hunger"] call EFUNC(common,addStatusModifier);

    if !(player getVariable [QGVAR(tremor), false]) then {
        [player, 120] call EFUNC(medical,tremor);
    };
};

