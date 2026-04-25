#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes animation for items with their pre-mapped data
 *
 * Arguments:
 * 0: Item Classname <CLASSNAME>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Land_BottlePlastic_V2_F"] call misery_animations_fnc_process
*/

params ["_item"];

MACRO_PROCESS_ITEM_ACTION(_item)
