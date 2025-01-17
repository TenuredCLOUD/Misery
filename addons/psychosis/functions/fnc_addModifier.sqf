#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Adds psychosis modifier
 *
 * Arguments:
 * 0: Modifier <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_psychosis_fnc_addModifier
 *
*/

params ["_modifier"];

GVAR(additionalModifiers) = GVAR(additionalModifiers) + _modifier;
