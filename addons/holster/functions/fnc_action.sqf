#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Holster action processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_holster_fnc_action
 *
*/

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};


