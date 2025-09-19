#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge Framework Item Checker
 *
 * Arguments:
 * 0: Required items <ARRAY> ([["item1", count]])
 *
 * Return Value:
 * BOOL
 *
 * Example:
 * [["iron_Ore", 1]] call misery_forge_fnc_canProcessCheck
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
