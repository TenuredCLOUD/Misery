#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ensures the arrays for ambient ai equipment are array format
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_convertToArray
*/

GVAR(primaryWeapons) = parseSimpleArray GVAR(primaryWeapons);
GVAR(secondaryWeapons) = parseSimpleArray GVAR(secondaryWeapons);
GVAR(launcherWeapons) = parseSimpleArray GVAR(launcherWeapons);
GVAR(items) = parseSimpleArray GVAR(items);
GVAR(nvgs) = parseSimpleArray GVAR(nvgs);
GVAR(facewear) = parseSimpleArray GVAR(facewear);
GVAR(headgear) = parseSimpleArray GVAR(headgear);
GVAR(uniform) = parseSimpleArray GVAR(uniform);
GVAR(vest) = parseSimpleArray GVAR(vest);
GVAR(backpack) = parseSimpleArray GVAR(backpack);
