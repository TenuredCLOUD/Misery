#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles menu unloading & resetting of vars
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_unloadMenu;
*/

private _dealer = player getVariable [QGVAR(currentDealer), objNull];

if (!isNull _dealer) then {
    _dealer setVariable [QGVAR(isActive), false, true];
};

player setVariable [QGVAR(currentDealer), nil];
