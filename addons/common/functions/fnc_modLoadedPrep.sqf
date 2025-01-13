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
    ["ravage", isClass (configFile >> "CfgPatches" >> "ravage")],
    ["VandeansonsApocalypse", isClass (configFile >> "CfgPatches" >> "VandeansonsApocalypse")],
    ["ace_main", isClass (configFile >> "CfgPatches" >> "ace_main")],
    ["ace_medical", isClass (configFile >> "CfgPatches" >> "ace_medical")],
    ["ace_refuel", isClass (configFile >> "CfgPatches" >> "ace_refuel")],
    ["NerdMods_iBuild", isClass (configFile >> "CfgPatches" >> "NerdMods_iBuild")],
    ["remnant", isClass (configFile >> "CfgPatches" >> "remnant")],
    ["DSA_Spooks",  isClass (configFile >> "CfgPatches" >> "DSA_Spooks")]
];

{
    params ["_addonName", "_isLoaded"];
    GVAR(modLoadedCache) set [_addonName, _isLoaded, true];
} forEach _modPrep;
