#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Framework Item Checker
 *
 * Arguments:
 * 0: Required items <ARRAY> ([["item1", count, remove], ["item2", count, remove]])
 *
 * Return Value:
 * BOOL
 *
 * Example:
 * [["cast_iron_pot", 1, false], ["water", 1, true]] call misery_cooking_fnc_canCookCheck
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
