#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes portable battery kits / inverters state variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_initBatteries;
 *
 * Public: No
*/

[QCLASS(batteryPack_black), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(batteryPack_od), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;

[QCLASS(batteryPack_sand), "Init", {
    params ["_battery"];

    _battery setVariable [QGVAR(batteryLevel), 0, true];
    _battery setVariable [QGVAR(supplying), false, true];

}, true, [], true] call CBA_fnc_addClassEventHandler;
