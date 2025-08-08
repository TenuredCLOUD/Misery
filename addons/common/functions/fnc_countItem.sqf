#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Counts the number of a specific item in the player's inventory
 *
 * Arguments:
 * 0: Item <STRING>
 *
 * Return Value:
 * 0: Item Count <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_countItem
 *
 */

params ["_item"];

private _allItems = (uniformItems player) + (vestItems player) + (backpackItems player) + (magazines player);

private _totalCount = {_x isEqualTo _item} count _allItems;

[QUOTE(COMPONENT_BEAUTIFIED), format ["Counted %1 items: %2", _totalCount, _item]] call EFUNC(common,debugMessage);

_totalCount
