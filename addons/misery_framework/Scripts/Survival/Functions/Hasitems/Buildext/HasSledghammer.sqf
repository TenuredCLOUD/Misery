/*
Misery sledgehammer check fnc (iBuild compat)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_hasSledgehammer"];

_hasSledgehammer = FALSE;

if (MiseryWBKIMS == true) then {
    if (("Misery_Sledghammer" in items player || "WBK_survival_weapon_2" in (weapons player)) && (call Misery_fnc_NearNMB)) then {
        _hasSledgehammer = TRUE;
    };
} else {
    if ("Misery_Sledghammer" in items player && (call Misery_fnc_NearNMB)) then {
        _hasSledgehammer = TRUE;
    };
};

if (_hasSledgehammer) exitWith {};
_hasSledgehammer //return
