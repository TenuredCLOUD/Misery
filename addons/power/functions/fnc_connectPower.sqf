#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Connect devices to power providers
 *
 * Arguments:
 * 0: Generator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_connectPower
 *
*/

params ["_provider", "_device"];

// Check if device even has a power requirement
if (isNil {_device getVariable QGVAR(powerRequired)}) exitWith {};

private _config = configFile >> "CfgVehicles" >> _provider;

private _connected = getArray (_config >> QGVAR(connected));

_connected pushBack _device;

