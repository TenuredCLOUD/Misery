#include "..\script_component.hpp"
/*
Misery hammer check fnc (iBuild compat)
Designed specifically for Misery mod
by TenuredCLOUD
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
