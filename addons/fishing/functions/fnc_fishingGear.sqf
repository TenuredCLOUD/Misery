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

if ("Misery_fishingpole" in _Check_items && "Misery_fishingspool" in _Check_items && "Misery_fishhook" in _Check_items && "Misery_worms" in _Check_items)  then {

    _fishinggear = true;

    if (_fishinggear)exitwith{};
};
        _fishinggear //return
