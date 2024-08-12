#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Checks if the player has an item.
 *
 * Arguments:
 * 0: Items <ARRAY>
 * 1: Player Items <ARRAY>
 *
 * Return Value:
 * 0: Item Found <BOOL>
 *
 * Example:
 * [] call misery_fnc_common_inArray
*/

params ["_items", "_playerItems"];

// Lower case both arrays
_items = _items call FUNC(lowerCaseArray);
_playerItems = _playerItems call FUNC(lowerCaseArray);

private _itemCheck = _items arrayIntersect _playerItems;

count _itemCheck > 0
