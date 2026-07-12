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

GVAR(primaryWeaponsCached) = parseSimpleArray GVAR(primaryWeapons);
GVAR(secondaryWeaponsCached) = parseSimpleArray GVAR(secondaryWeapons);
GVAR(launcherWeaponsCached) = parseSimpleArray GVAR(launcherWeapons);
GVAR(itemsCached) = parseSimpleArray GVAR(items);
GVAR(nvgsCached) = parseSimpleArray GVAR(nvgs);
GVAR(facewearCached) = parseSimpleArray GVAR(facewear);
GVAR(headgearCached) = parseSimpleArray GVAR(headgear);
GVAR(uniformCached) = parseSimpleArray GVAR(uniform);
GVAR(vestCached) = parseSimpleArray GVAR(vest);
GVAR(backpackCached) = parseSimpleArray GVAR(backpack);

{
    publicVariable _x;
} forEach [
    QGVAR(primaryWeaponsCached),
    QGVAR(secondaryWeaponsCached),
    QGVAR(launcherWeaponsCached),
    QGVAR(itemsCached),
    QGVAR(nvgsCached),
    QGVAR(facewearCached),
    QGVAR(headgearCached),
    QGVAR(uniformCached),
    QGVAR(vestCached),
    QGVAR(backpackCached)
];
