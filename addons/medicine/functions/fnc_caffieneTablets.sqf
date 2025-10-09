#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffeine usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffieneTablets;
 *
*/

if (isMultiplayer) exitWith {
    [3, 2] call EFUNC(common,chromaticEffect);

    player enableFatigue false;

    [{
        player enableFatigue true;
        player setFatigue 0;
    }, [], 600] call CBA_fnc_waitAndExecute;
};

[{
    [-0.15, "energy"] call EFUNC(common,addStatusModifier);
}, [], 15] call CBA_fnc_waitAndExecute;

[3, 2] call EFUNC(common,chromaticEffect);

player enableFatigue false;

[{
    player enableFatigue true;
    player setFatigue 0;
}, [], 600] call CBA_fnc_waitAndExecute;



