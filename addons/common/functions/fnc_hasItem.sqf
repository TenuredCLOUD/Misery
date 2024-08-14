#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Checks if the player has an item, player loadout is cached to reduce how often unique items are called.
 * Items check includes everything, even weapons.
 *
 * Arguments:
 * 0: Items <ARRAY>
 *
 * Return Value:
 * 0: Item Found <BOOL>
 *
 * Example:
 * [] call misery_fnc_common_hasItem
*/

params ["_items"];

if (isNil QGVAR(itemsCache)) then {
    GVAR(itemsCache) = [player, true, true, true, true, true, true] call CBA_fnc_uniqueUnitItems;
};

// Lower case both arrays
_items = _items call FUNC(lowerCaseArray);
GVAR(itemsCache) = GVAR(itemsCache) call FUNC(lowerCaseArray);

private _itemCheck = _items arrayIntersect GVAR(itemsCache);

count _itemCheck > 0
