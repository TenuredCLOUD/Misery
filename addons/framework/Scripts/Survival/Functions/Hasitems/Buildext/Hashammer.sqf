/*
Misery hammer check fnc (iBuild compat)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_hashammer"];

_hashammer = FALSE;

if (MiseryWBKIMS == true) then {
    if ("Misery_craftinghammer" in items player || "Misery_Anvilhammer" in items player || "WBK_SmallHammer" in (weapons player)) then {
        _hashammer = TRUE;
    };
} else {
    if ("Misery_craftinghammer" in items player || "Misery_Anvilhammer" in items player) then {
        _hashammer = TRUE;
    };
};

if (_hashammer) exitWith {};
_hashammer //return
