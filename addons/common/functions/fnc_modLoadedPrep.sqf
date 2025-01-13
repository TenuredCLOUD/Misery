#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Prepares the mod loaded cache.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_modLoadedPrep
*/

private _modPrep = [
    ["ravage", isClass (configFile >>"cfgPatches" >> "ravage")],
    ["VandeansonsApocalypse", isClass (configFile >> "cfgPatches" >> "VandeansonsApocalypse")],
    ["ace_main", isClass (configFile >>"cfgPatches" >> "ace_main")],
    ["ace_medical", isClass (configFile >>"cfgPatches" >> "ace_medical")],
    ["ace_refuel", isClass (configFile >>"cfgPatches" >> "ace_refuel")],
    ["NerdMods_iBuild", isClass (configFile >>"cfgPatches" >> "NerdMods_iBuild")],
    ["remnant", isClass (configFile >>"cfgPatches" >> "remnant")],
    ["DSA_Spooks",  isClass (configFile >>"cfgPatches" >> "DSA_Spooks")]
];

{
    params ["_addonName", "_isLoaded"];
    GVAR(modLoadedCache) set [_addonName, _isLoaded, true];
} forEach _modPrep;
