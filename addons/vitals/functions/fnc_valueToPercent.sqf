#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process value for tooltip
 *
 * Arguments:
 * 0: Current Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_valueToPercent;
 */

params ["_value"];

private _formatted = [(_value * 100), 1, 1, false] call CBA_fnc_formatNumber;

_formatted
