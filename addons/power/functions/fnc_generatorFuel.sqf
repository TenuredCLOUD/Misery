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
 * [] call misery_power_fnc_generatorFuel
 *
*/

params ["_generator", "_generatorType"];

private _config = configFile >> "CfgVehicles" >> _generatorType;
private _fuelDelay = getNumber (_config >> QGVAR(fuelDelay));

[{
    params ["_args", "_handle"];
    _args params ["_generator"];

    private _runState = _generator getVariable [QGVAR(generatorRunning), false];
    private _fuelLevel = _generator getVariable [QGVAR(generatorFuel), 0];

    if (!_runState || _fuelLevel <= 0) exitWith {
        if (_fuelLevel < 0) then {
            _generator setVariable [QGVAR(generatorFuel), 0, true];
        };
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _generator setVariable [QGVAR(generatorFuel), _fuelLevel - 0.01, true];
}, _fuelDelay, [_generator]] call CBA_fnc_addPerFrameHandler;
