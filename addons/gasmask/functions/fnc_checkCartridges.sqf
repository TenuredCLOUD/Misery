#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Gasmask cartridge life remaining check (sorted to grab lowest in inventory)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Remaining <NUMBER>
 *
 * Example:
 * [] call misery_gasmask_fnc_checkCartriges
 *
*/

private _magazines = magazinesAmmo ACE_player;

private _cartridgeData = _magazines select {(_x select 0) isEqualTo QCLASS(gasCartridge)};

private _remaining = if (_cartridgeData isNotEqualTo []) then {
    _cartridgeData sort true;

    private _lowestRemaining = (_cartridgeData select 0) select 1;
    (_lowestRemaining / 100) min 1 max 0
} else {
    0
};

_remaining
