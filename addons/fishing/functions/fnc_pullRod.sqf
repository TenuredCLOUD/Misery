#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pulls the rod to unsnag or tire a fish
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_pullRod
 *
*/

private _display = findDisplay 982387;

if (isNull _display) exitWith {};

if (GVAR(isSnagged)) then {
    if ([30] call EFUNC(common,rollChance)) then {
        GVAR(isSnagged) = false;
        ctrlSetText [1001, "Line unsnagged!"];
    } else {
        GVAR(lineTension) = (GVAR(lineTension) + 0.15) min 1;
        ctrlSetText [1001, "Still snagged, keep trying!"];
    };
} else {
    if (GVAR(fishOn)) then {
        GVAR(fishStrength) = (GVAR(fishStrength) - 0.1) max 0;
        GVAR(lineTension) = (GVAR(lineTension) + 0.1) min 1;
        if (GVAR(fishStrength) <= 0) then {
            ctrlSetText [1001, "Fish is tired! Reel it in!"];
        } else {
            ctrlSetText [1001, "Fish is fighting, keep pulling!"];
        };
    } else {
        ctrlSetText [1001, "Nothing to pull against."];
    };
};
