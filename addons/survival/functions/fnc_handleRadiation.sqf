#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles radiation related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 * 1: Parasites <NUMBER>
 * 2: Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleRadiation;
 *
 * Public: No
*/

params ["_radiation", "_parasites"];

if (_radiation > 0) then {
    [-0.001, "radiation"] call EFUNC(common,addStatusModifier);
    private _random = [1, 10] call BIS_fnc_randomInt;

    if (_random isEqualTo 5 && _radiation > 0.05 && GVAR(ailments)) then {
        if (_parasites > 0) then {
            player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
        };
    };
};
