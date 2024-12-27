#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * checks if a player has fishing gear
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_fishing_fnc_fishingGear
 *
*/

private ["_canfish"];

_fishinggear =false;

_Check_items = items player;

if (QCLASS(fishingPole) in _Check_items && QCLASS(fishingSpool) in _Check_items && QCLASS(fishhook) in _Check_items && QCLASS(worms) in _Check_items)  then {

    _fishinggear = true;

    if (_fishinggear)exitWith{};
};
        _fishinggear //return
