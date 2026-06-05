#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes portable generator state variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_initGenerators;
 *
 * Public: No
*/

[QCLASS(petrolGenerator), "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(generatorFuel), 0, true];
    _generator setVariable [QGVAR(generatorRunning), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(dieselGenerator), "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(generatorFuel), 0, true];
    _generator setVariable [QGVAR(generatorRunning), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(kvaGenerator), "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(generatorFuel), 0, true];
    _generator setVariable [QGVAR(generatorRunning), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;
