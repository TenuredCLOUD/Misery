#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if the player has any filled water containers to dump
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Player has a container to dump <BOOL>
 *
 * Example:
 * [] call misery_hydrology_fnc_canDumpWater;
 *
*/

private _dumpContainers = [
    QCLASS(canteen_Purified),
    QCLASS(canteen_Clean),
    QCLASS(canteen_Dirty),
    QCLASS(waterBottle_Purified),
    QCLASS(waterBottle_Clean),
    QCLASS(waterBottle_Dirty),
    QCLASS(waterJerryCan_Purified),
    QCLASS(waterJerryCan_Clean),
    QCLASS(waterJerryCan_Dirty)
];

_dumpContainers findIf { [_x] call EFUNC(common,countItem) > 0 } isNotEqualTo -1
