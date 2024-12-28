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
    if ([[QCLASS(craftingHammer),QCLASS(anvilHammer),"WBK_SmallHammer"]] call EFUNC(common,hasItem)) then {
        _hashammer = true;
    };
} else {
    if ([[QCLASS(craftingHammer),QCLASS(anvilHammer)]] call EFUNC(common,hasItem)) then {
        _hashammer = true;
    };
};

if (_hashammer) exitWith {};
_hashammer //return
