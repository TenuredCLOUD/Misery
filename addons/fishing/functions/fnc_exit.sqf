#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Exits the fishing UI and cleans up
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_exitFishing
 *
*/

private _display = findDisplay 982387;

if (!isNull _display) then {
    closeDialog 2;
};

GVAR(lineOut) = nil;
GVAR(lineTension) = nil;
GVAR(isSnagged) = nil;
GVAR(fishOn) = nil;
GVAR(fishStrength) = nil;
