#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Reels in the fishing line, affecting line out and tension
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_reelIn
 *
*/

private _display = findDisplay 982387;

if (isNull _display) exitWith {};

GVAR(lineOut) = (GVAR(lineOut) - 0.05) max 0;
GVAR(lineTension) = (GVAR(lineTension) + 0.1) min 1;

if (GVAR(lineOut) <= 0 && GVAR(fishOn)) then {
    [QEGVAR(common,tileText), localize LSTRING(CaughtFish)] call CBA_fnc_localEvent;
    [player, QCLASS(rawFish), true] call CBA_fnc_addItem;

    // Random bait loss from fish digesting it
    if ([50] call EFUNC(common,rollChance)) then {
        [player, QCLASS(worms)] call CBA_fnc_removeItem;
    };
    [] call FUNC(exit);
} else {
    if (GVAR(lineOut) <= 0) then {
        [QEGVAR(common,tileText), localize LSTRING(FullyReeledIn)] call CBA_fnc_localEvent;
        [] call FUNC(exit);
    };
};
