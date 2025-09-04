#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Display control show / hide
 * Shows or hides listed control idc's that are listed
 * Cannot be used on RscTitle classed displays
 *
 * Arguments:
 * 0: Display idd <NUMBER>
 * 1: Display control idcs <ARRAY>
 * 2: Show control <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, [1], false] call misery_common_fnc_displayShowControls;
 *
 * Public: No
*/

params ["_display", ["_controls", [0]], ["_condition", {true}, [{}, true, false]]];

{
    findDisplay _display displayCtrl _x ctrlShow _condition;
} forEach _controls;
