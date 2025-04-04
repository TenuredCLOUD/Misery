#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles thirst related things for survival loop.
 *
 * Arguments:
 * 0: Thirst <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleThirst;
 *
 * Public: No
*/

params ["_thirst"];

private _finalThirst = ((_thirst + GVAR(thirstModifiers)) min 1) max 0;
GVAR(thirstModifiers) = 0;
player setVariable [QGVAR(thirst), _finalThirst];

if (_finalThirst isEqualTo 0) then {
    [player, 100] call EFUNC(common,specialDamage);
};
