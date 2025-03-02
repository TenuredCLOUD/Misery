#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Item Checker
 *
 * Arguments:
 * 0: Required items <ARRAY> ([["item1", count, remove], ["item2", count, remove]])
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [["misery_electricHandsaw", 1, false], ["misery_woodenlog", 1, true]] call misery_crafting_fnc_canCraftCheck
 *
 * Public: No
*/

params ["_requiredItems"];

private _playerItems = (items player) + (magazines player);
private _hasAll = true;

{
    private _item = _x select 0;
    private _count = _x select 1;
    private _playerCount = {_x isEqualTo _item} count _playerItems;

    if (_playerCount < _count) then {
        _hasAll = false;
    };
} forEach _requiredItems;

_hasAll
