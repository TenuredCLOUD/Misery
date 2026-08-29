#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * TSP Item swapping
 * Swaps Misery items to TSP weapons if enabled
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_tsp_fnc_swapItems
 *
*/

// Knives & Axes
{
    private _oldToolItem = _x select 0;
    private _newToolItem = _x select 1;

    if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldToolItem] call CBA_fnc_removeItem;
        [ACE_player, _newToolItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_TSP_COMPAT;
