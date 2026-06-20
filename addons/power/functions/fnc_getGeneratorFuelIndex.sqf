#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks generator object to index in generator classes array, if 0 - 4 they're petrol
 * Returns fuel type index
 *
 * Arguments:
 * 0: Generator <OBJECT>
 *
 * Return Value:
 * 0: Fuel type <NUMBER>
 *
 * Example:
 * [] call misery_power_fnc_getGeneratorFuelIndex;
 */

params ["_generator"];

if ((typeOf _generator) in (GVAR(generators) select [0, 4])) exitWith { 1 };

0
