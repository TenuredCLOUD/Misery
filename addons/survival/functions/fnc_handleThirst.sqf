#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles thirst related things for survival loop.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleThirst;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "_thirst"];

private _finalThirst = ((_thirst + GVAR(thirstModifiers)) min 1) max 0;
GVAR(thirstModifiers) = 0;
player setVariable [QGVAR(thirst), _finalThirst];

