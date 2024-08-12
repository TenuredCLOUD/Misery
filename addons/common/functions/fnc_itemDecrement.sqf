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
 * None
 *
 * Example:
 * [] call misery_fnc_common_itemDecrement
*/

params ["_item", ["_replacementItem", ""]];

private _magazines = magazinesAmmo player;
private _itemContainer = _magazines findIf {(_x select 0) == _item};

if (_itemContainer != -1) then {
    private _containerCount = (_magazines select _itemContainer) select 1;

    if (_containerCount > 1) then {
        player removeMagazine _item;
        player addMagazine [_item, (_containerCount -1)];
    } else {
        player removeMagazine _item;
        if (_replacementItem isNotEqualTo "") then {
            [player, _replacementItem, true] call CBA_fnc_addItem;
        };
    };
};
