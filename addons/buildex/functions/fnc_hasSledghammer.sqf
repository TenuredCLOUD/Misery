#include "..\script_component.hpp"
/*
Misery sledgehammer check fnc (iBuild compat)
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_hasSledgehammer"];

_hasSledgehammer = false;

if (MiseryWBKIMS) then {
    if (("Misery_Sledghammer" in items player || "WBK_survival_weapon_2" in (weapons player)) && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
} else {
    if ("Misery_Sledghammer" in items player && ([[MACRO_NMB_ITEMS], 5] call EFUNC(common,nearCraftingStation))) then {
        _hasSledgehammer = true;
    };
};

if (_hasSledgehammer) exitWith {};
_hasSledgehammer //return
