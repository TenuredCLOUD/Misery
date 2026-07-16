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
 * [] call misery_common_fnc_getSimplifiedLoadout
*/

private _playerGear = [];

_playerGear pushBack (uniform ACE_player);
_playerGear pushBack (vest ACE_player);
_playerGear pushBack (goggles ACE_player);
_playerGear pushBack (headgear ACE_player);
_playerGear pushBack (backpack ACE_player);

_playerGear
