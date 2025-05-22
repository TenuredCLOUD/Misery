#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Checks if object / item is in certain configType
 *
 * Arguments:
 * 0: Object <STRING>
 * 1: Config type <STRING>
 *
 * Return Value:
 * 0: Bool
 *
 * Example:
 * [] call misery_common_fnc_configCheck
 *
*/

params ["_class", ["_configType", "CfgVehicles"]];

isClass (configFile >> _configType >> _class)
