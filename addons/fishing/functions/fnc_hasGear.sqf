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
 * [] call misery_fishing_fnc_hasGear
 *
*/

_hasGear =false;

if ([QCLASS(fishingPole), QCLASS(fishingSpool), QCLASS(fishhook), QCLASS(worms)] call EFUNC(common,hasItem)) then {
    _hasGear = true;
};

_hasGear
