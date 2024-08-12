#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Returns a simplified loadout of uniform, vest, goggles, headgear and backpack.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Loadout <ARRAY>
 *
 * Example:
 * [] call misery_fnc_common_getSimplifiedLoadout
*/

private _playerGear = [];

_playerGear pushBack (uniform player);
_playerGear pushBack (vest player);
_playerGear pushBack (goggles player);
_playerGear pushBack (headgear player);
_playerGear pushBack (backpack player);

_playerGear
