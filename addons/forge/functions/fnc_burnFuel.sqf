#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge fuel burn loop for all forge objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_burnFuel
 *
*/

[{
    params ["_args", "_handle"];

    if ((count GVAR(tracked)) < 1) exitWith {};

    {
        private _currentFuel = _x getVariable [QGVAR(fuel), 0];
        if (_currentFuel isNotEqualTo 0) then {
        _x setVariable [QGVAR(fuel), _currentFuel - 0.01, true]
        };
    } forEach GVAR(tracked);
}, 60, []] call CBA_fnc_addPerFrameHandler;
