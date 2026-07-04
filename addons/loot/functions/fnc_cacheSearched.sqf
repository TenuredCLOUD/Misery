#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caches searched object position to array
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_cacheSearched;
 *
*/

params ["_position"];

// Check if position is already cached (within 0.5 meters)
if (GVAR(searchedPositions) findIf {_x vectorDistance _position < 0.5} isEqualTo -1) then {

    GVAR(searchedPositions) pushBack _position;

    publicVariable QGVAR(searchedPositions);

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached searched position %1", _position]] call EFUNC(common,debugMessage);
};
