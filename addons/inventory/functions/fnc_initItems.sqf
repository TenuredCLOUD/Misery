#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initialize items dialog
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call misery_inventory_fnc_initItems;
 *
*/

params ["_display"];

_display setVariable ["display", _display];
[_display] call FUNC(populateCategories);
[_display] call FUNC(populateItemsList);
