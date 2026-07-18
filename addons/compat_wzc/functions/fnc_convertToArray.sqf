#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ensures the arrays for zombie equipment are array format
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_convertToArray
*/

GVAR(clothingCivCached) = parseSimpleArray GVAR(clothingCiv);
GVAR(clothingMilCached) = parseSimpleArray GVAR(clothingMil);
GVAR(headgearCivCached) = parseSimpleArray GVAR(headgearCiv);
GVAR(headgearMilCached) = parseSimpleArray GVAR(headgearMil);
GVAR(facewearCivCached) = parseSimpleArray GVAR(facewearCiv);
GVAR(facewearMilCached) = parseSimpleArray GVAR(facewearMil);
GVAR(vestCivCached) = parseSimpleArray GVAR(vestCiv);
GVAR(vestMilCached) = parseSimpleArray GVAR(vestMil);
GVAR(bagCivCached) = parseSimpleArray GVAR(bagCiv);
GVAR(bagMilCached) = parseSimpleArray GVAR(bagMil);
GVAR(itemsCivCached)= parseSimpleArray GVAR(itemsCiv);
GVAR(itemsMilCached) = parseSimpleArray GVAR(itemsMil);
GVAR(weaponsCached) = parseSimpleArray GVAR(weapons);

{
    publicVariable _x;
} forEach [
    QGVAR(clothingCivCached),
    QGVAR(clothingMilCached),
    QGVAR(headgearCivCached),
    QGVAR(headgearMilCached),
    QGVAR(facewearCivCached),
    QGVAR(facewearMilCached),
    QGVAR(vestCivCached),
    QGVAR(vestMilCached),
    QGVAR(bagCivCached),
    QGVAR(bagMilCached),
    QGVAR(itemsCivCached),
    QGVAR(itemsMilCached),
    QGVAR(weaponsCached)
];
