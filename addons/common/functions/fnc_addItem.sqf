#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * CBA_addItem wrapper for incremental adding of items
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item <CLASSNAME>
 * 2: Amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * [] call misery_common_fnc_addItem;
 *
*/

params ["_unit", "_item", ["_amount", 1]];

for "_i" from 1 to _amount do {
    [_unit, _item, true] call CBA_fnc_addItem;
};
