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
 * [] call misery_common_fnc_hasItem
*/

params ["_items"];

// Cache is updated when loadout changes and this function re-runs.
if (isNil QGVAR(itemsCache)) then {
    private _uniqueUnitItems = [player, true, true, true, true, true, true] call CBA_fnc_uniqueUnitItems;
    {
        if (_x isEqualTo "") then {continue}; // skip gear that doesn't exist
        _uniqueUnitItems pushBack _x;
    } forEach [uniform player, vest player, backpack player, headgear player, goggles player];
    GVAR(itemsCache) = _uniqueUnitItems;
};

// Lower case both arrays
_items = [_items] call FUNC(lowerCaseArray);
GVAR(itemsCache) = [GVAR(itemsCache)] call FUNC(lowerCaseArray);

private _itemCheck = _items arrayIntersect GVAR(itemsCache);

_itemCheck isNotEqualTo []
