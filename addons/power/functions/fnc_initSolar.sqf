#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes portable solar kits state variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_initSolar;
 *
 * Public: No
*/

[QCLASS(portable_solar_black), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(portable_solar_od), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(portable_solar_sand), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;
