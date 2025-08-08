#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Unconscious simulation
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Unconscious time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_setUnconscious;
 *
*/

params ["_object", ["_time", 1]];

cutText ["", "BLACK OUT", 1, true, false];

_object setUnconscious true;

[{
    cutText ["", "BLACK IN", 10, true, false];
    _this setUnconscious false;
}, _object, _time] call CBA_fnc_waitAndExecute;
