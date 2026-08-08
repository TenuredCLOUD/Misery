#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Decrements magazine type items by 1 each use, if container has only 1 count left, it is removed on last use.
 *
 * Arguments:
 * 0: Item <STRING>
 * 1: Replacement Item <STRING> (default: "")
 *
 * Return Value:
 * 0: Decremented <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_itemDecrement
*/

params ["_item", ["_replacementItem", ""]];

private _magazines = magazinesAmmo ACE_player;

private _matches = _magazines select {(_x select 0) isEqualTo _item};

if (_matches isEqualTo []) exitWith { false };

_matches sort true;

private _allAmmoCounts = _matches apply {_x select 1};

ACE_player removeMagazines _item;

private _lowestCount = _allAmmoCounts select 0;

if (_lowestCount > 1) then {
    _allAmmoCounts set [0, _lowestCount - 1];
} else {
    _allAmmoCounts deleteAt 0;
    if (_replacementItem isNotEqualTo "") then {
        [ACE_player, _replacementItem, true] call CBA_fnc_addItem;
    };
};

{
    [ACE_player, _item, _x, true] call CBA_fnc_addMagazine;
} forEach _allAmmoCounts;

true
