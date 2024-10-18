#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * hammer check fnc (iBuild compat)
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_buildex_fnc_hasHammer;
 *
*/

private ["_hashammer"];

_hashammer = false;

if (MiseryWBKIMS) then {
    if ("Misery_craftinghammer" in items player || "Misery_Anvilhammer" in items player || "WBK_SmallHammer" in (weapons player)) then {
        _hashammer = true;
    };
} else {
    if ("Misery_craftinghammer" in items player || "Misery_Anvilhammer" in items player) then {
        _hashammer = true;
    };
};

if (_hashammer) exitWith {};
_hashammer //return
