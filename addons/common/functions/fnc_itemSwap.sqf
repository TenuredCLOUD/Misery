#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Filters through active items in inventory and if matches an auto swap instance will automatically convert Items
 * Utilizing CBA_fnc_addItem if no room in inventory new item will automatically drop to the ground
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Old Item <STRING>
 * 2: New Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_common_itemSwap
*/

params ["_unit", "_oldItem", "_newItem"];

if (_oldItem in items _unit) then {
    _unit removeItem _oldItem;
    [_unit, _newItem, true] call CBA_fnc_addItem;
};

if (_oldItem in magazines _unit) then {
    _unit removeMagazine _oldItem;
    [_unit, _newItem, true] call CBA_fnc_addItem;
};
