#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if a mod is loaded
 *
 * Arguments:
 * 0: Addon Name
 *
 * Return Value:
 * 0: Is loaded <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_isModLoaded
*/

params ["_addon"];

if (_addon in [MACRO_PREPPED_MODS]) exitWith {
    GVAR(modLoadedCache) getOrDefault [_addon, false]
};

isClass (configFile >> "CfgPatches" >> _addon)
