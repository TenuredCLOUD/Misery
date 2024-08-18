#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Listbox index value checker
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE 
 *
 * Example:
 * [] call misery_crafting_fnc_LBIndexCheck
 *
 * Public: No
*/

params ["_ctrl", "_str"];
private _count = lbSize _ctrl;
for "_i" from 0 to (_count - 1) do {
if ((lbText [_ctrl, _i]) isEqualTo _str) exitWith {_i};
};
-1
