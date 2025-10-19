#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Loot Blacklist filtering
 *
 * Arguments:
 * 0: Array to filter <ARRAY>
 *
 * Return Value:
 * 0: Filtered array containing only non-blacklisted items, with a random selection from the filtered array
 *
 * Example:
 * [] call misery_loot_fnc_blacklistFilter;
 *
*/

params ["_array"];
private _filteredArray = _array select {!(_x in GVAR(itemsBlacklist))};
if (_filteredArray isNotEqualTo []) then {
    selectRandom _filteredArray;
} else {
    if (count GVAR(itemsBlacklist) > 0) then {""} else {selectRandom _array};
};
