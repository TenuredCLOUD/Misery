#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Wrapper for CBA_fnc_players, getting only alive players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Players <ARRAY>
 *
 * Example:
 * [] call misery_common_fnc_listPlayers
*/

(call CBA_fnc_players) select {alive _x}
