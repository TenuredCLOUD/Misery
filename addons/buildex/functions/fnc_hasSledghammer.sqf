#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * sledghammer check fnc (iBuild compat)
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_buildex_fnc_hasSledghammer;
 *
*/

private ["_hasSledgehammer"];

_hasSledgehammer = false;

if (MiseryWBKIMS) then {
    if (([["Misery_Sledghammer","WBK_survival_weapon_2"]] call EFUNC(common,hasItem)) && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
} else {
    if ([["Misery_Sledghammer"]] call EFUNC(common,hasItem) && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
};

if (_hasSledgehammer) exitWith {};
_hasSledgehammer //return
