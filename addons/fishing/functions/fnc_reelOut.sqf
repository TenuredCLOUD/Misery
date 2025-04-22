#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Reels out the fishing line, affecting line out and tension
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_reelOut
 *
*/

private _display = findDisplay 982387;

if (isNull _display) exitWith {};

GVAR(lineOut) = (GVAR(lineOut) + 0.05) min 1;
GVAR(lineTension) = (GVAR(lineTension) - 0.05) max 0;

if (GVAR(lineOut) >= 1) then {
    ctrlSetText [1001, "Line fully reeled out."];
};
