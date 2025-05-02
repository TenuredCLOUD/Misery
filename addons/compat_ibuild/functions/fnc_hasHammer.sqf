#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check if player has a hammer
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_buildex_fnc_hasHammer;
 *
*/

private _hasHammer = false;

if (["WBK_MeleeMechanics"] call EFUNC(common,isModLoaded)) then {
    if ([[QCLASS(craftingHammer), QCLASS(anvilHammer), "WBK_SmallHammer"]] call EFUNC(common,hasItem)) then {
        _hasHammer = true;
    };
} else {
    if ([[QCLASS(craftingHammer), QCLASS(anvilHammer)]] call EFUNC(common,hasItem)) then {
        _hasHammer = true;
    };
};

_hasHammer
