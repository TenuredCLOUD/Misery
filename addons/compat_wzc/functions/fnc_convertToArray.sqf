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

GVAR(clothingCiv) = parseSimpleArray GVAR(clothingCiv);
GVAR(clothingMil) = parseSimpleArray GVAR(clothingMil);
GVAR(headgearCiv) = parseSimpleArray GVAR(headgearCiv);
GVAR(headgearMil) = parseSimpleArray GVAR(headgearMil);
GVAR(facewearCiv) = parseSimpleArray GVAR(facewearCiv);
GVAR(facewearMil) = parseSimpleArray GVAR(facewearMil);
GVAR(vestCiv) = parseSimpleArray GVAR(vestCiv);
GVAR(vestMil) = parseSimpleArray GVAR(vestMil);
GVAR(bagCiv) = parseSimpleArray GVAR(bagCiv);
GVAR(bagMil) = parseSimpleArray GVAR(bagMil);
GVAR(itemsCiv) = parseSimpleArray GVAR(itemsCiv);
GVAR(itemsMil) = parseSimpleArray GVAR(itemsMil);
GVAR(weapons) = parseSimpleArray GVAR(weapons);
