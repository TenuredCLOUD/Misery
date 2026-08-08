#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process Thirst to Litre value for tooltip
 *
 * Arguments:
 * 0: Current Thirst <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_thirstToLitres;
 */

params ["_value"];

private _formatted = [(((_value * 3.0) * 10)) / 10, 1, 1, false] call CBA_fnc_formatNumber;

_formatted
