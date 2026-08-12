#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process Hunger to Kcal value for tooltip
 *
 * Arguments:
 * 0: Current Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_hungerToKcal;
 */

params ["_value"];

private _formatted = [(_value * 3000), 1, 1, false] call CBA_fnc_formatNumber;

_formatted
