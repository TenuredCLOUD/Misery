#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Get connected devices from providers
 *
 * Arguments:
 * 0: Generator <OBJECT>
 *
 * Return Value:
 * 0: Connected Objects <ARRAY>
 *
 * Example:
 * [] call misery_power_fnc_getConnectedDevices
 *
*/

params ["_generator"];

private _config = configFile >> "CfgVehicles" >> _generator;

private _connected = getArray (_config >> QGVAR(connected));

_connected

