#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes generator state variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_initGenerators;
 *
 * Public: No
*/

["Land_Portable_generator_F", "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(fuelLevel), 0, true];
    _generator setVariable [QGVAR(fuelDelay), 60, true];
    _generator setVariable [QGVAR(isRunning), false, true];
    _generator setVariable [QGVAR(shuttingDown), false, true];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_PowerGenerator_F", "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(fuelLevel), 0, true];
    _generator setVariable [QGVAR(fuelDelay), 120, true];
    _generator setVariable [QGVAR(isRunning), false, true];
    _generator setVariable [QGVAR(shuttingDown), false, true];
}, true, [], true] call CBA_fnc_addClassEventHandler;
