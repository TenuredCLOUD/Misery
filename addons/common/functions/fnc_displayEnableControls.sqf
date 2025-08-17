#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Display control enabler / disabler
 * Disables or enables listed control idc's that are listed
 *
 * Arguments:
 * 0: Display idd <NUMBER>
 * 1: Display control idcs <ARRAY>
 * 2: Enable control <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, [1], false] call misery_common_fnc_displayEnableControls;
 *
 * Public: No
*/

params ["_display", ["_controls", [0]], ["_condition", {true}, [{}, true, false]]];

{
    findDisplay _display displayCtrl _x ctrlEnable _condition;
} forEach _controls;
