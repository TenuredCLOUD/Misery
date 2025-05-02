#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check if player has a sledgehammer
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_compat_ibuild_fnc_hasSledghammer;
 *
*/

private _hasSledgehammer = false;

if (["WBK_MeleeMechanics"] call EFUNC(common,isModLoaded)) then {
    if (([[QCLASS(sledgehammer), "WBK_survival_weapon_2"]] call EFUNC(common,hasItem)) && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
} else {
    if ([[QCLASS(sledgehammer)]] call EFUNC(common,hasItem) && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
};

_hasSledgehammer
