#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Fuel drain loop
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_fuel
 *
*/

params ["_generator", "_generatorType"];

private _fuelDelay = nil;

    switch (_generatorType) do {
        case "Land_Portable_generator_F": {
            _fuelDelay = 60;
        };
        case "Land_PowerGenerator_F": {
            _fuelDelay = 120;
        };
    };

[{
    params ["_args", "_handle"];
    _args params ["_generator"];

    private _runState = _generator getVariable [QGVAR(isRunning), false];
    private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];

    if (!_runState || _fuelLevel <= 0) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _generator setVariable [QGVAR(fuelLevel), _fuelLevel - 0.01, true];

}, _fuelDelay, [_generator]] call CBA_fnc_addPerFrameHandler;
