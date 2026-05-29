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
 * [] call misery_generator_fnc_initGenerators;
 *
 * Public: No
*/

["Land_Portable_generator_F", "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(fuelLevel), 0, true];
    _generator setVariable [QGVAR(fuelDelay), 60, true];
    _generator setVariable [QGVAR(startupDelay), 1, true];
    _generator setVariable [QGVAR(shutDownDelay), 1, true];
    _generator setVariable [QGVAR(runDelay), 11.5, true];
    _generator setVariable [QGVAR(isRunning), false, true];
    _generator setVariable [QGVAR(shuttingDown), false, true];
    _generator setVariable [QGVAR(powerRadius), 25, true];
    _generator setVariable [QGVAR(soundRadius), 50, true];
    _generator setVariable [QGVAR(soundStart), QEGVAR(audio,sound_petrolStart), true];
    _generator setVariable [QGVAR(soundRunning), QGVAR(sfx_v_petrolGenRun), true];
    _generator setVariable [QGVAR(soundStop), QEGVAR(audio,sound_petrolStop), true];
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(dieselGenerator), "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(fuelLevel), 0, true];
    _generator setVariable [QGVAR(fuelDelay), 120, true];
    _generator setVariable [QGVAR(startupDelay), 2, true];
    _generator setVariable [QGVAR(shutDownDelay), 3, true];
    _generator setVariable [QGVAR(runDelay), 11.5, true];
    _generator setVariable [QGVAR(isRunning), false, true];
    _generator setVariable [QGVAR(shuttingDown), false, true];
    _generator setVariable [QGVAR(powerRadius), 150, true];
    _generator setVariable [QGVAR(soundRadius), 100, true];
    _generator setVariable [QGVAR(soundStart), QEGVAR(audio,sound_dieselStart), true];
    _generator setVariable [QGVAR(soundRunning), QGVAR(sfx_v_dieselGenRun), true];
    _generator setVariable [QGVAR(soundStop), QEGVAR(audio,sound_dieselStop), true];
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(kvaGenerator), "Init", {
    params ["_generator"];

    _generator setVariable [QGVAR(fuelLevel), 0, true];
    _generator setVariable [QGVAR(fuelDelay), 240, true];
    _generator setVariable [QGVAR(startupDelay), 8, true];
    _generator setVariable [QGVAR(shutDownDelay), 6, true];
    _generator setVariable [QGVAR(runDelay), 9.5, true];
    _generator setVariable [QGVAR(isRunning), false, true];
    _generator setVariable [QGVAR(shuttingDown), false, true];
    _generator setVariable [QGVAR(powerRadius), 300, true];
    _generator setVariable [QGVAR(soundRadius), 500, true];
    _generator setVariable [QGVAR(soundStart), QEGVAR(audio,sound_kvaStart), true];
    _generator setVariable [QGVAR(soundRunning), QGVAR(sfx_v_kvaGenRun), true];
    _generator setVariable [QGVAR(soundStop), QEGVAR(audio,sound_kvaStop), true];
}, true, [], true] call CBA_fnc_addClassEventHandler;
