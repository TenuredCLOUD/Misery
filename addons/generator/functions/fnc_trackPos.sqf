#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Position Tracking
 *
 * Arguments:
 * 0: Generator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_trackPos
 *
*/

params ["_generator"];

private _lastPos = getPosATL _generator;

[{
    params ["_args", "_handle"];
    _args params ["_generator", "_lastPos"];

    _currentPos = getPosATL _generator;

    //Check if generator is "Moving" (Base item framework of somekind? if so kill running gen)
    if (_currentPos distance _lastPos > 0.01) exitWith {
        _generator setVariable [QGVAR(isRunning), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    //Check if generator no longer exists
    if (isNull _generator) exitWith {
        _generator setVariable [QGVAR(isRunning), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_generator, _lastPos]] call CBA_fnc_addPerFrameHandler;
