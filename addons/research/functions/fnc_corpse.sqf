#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check if nearest corpse is a zombie
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_research_fnc_corpse;
 *
*/

private ["_deadzed"];

_deadzed=false;

private _target = cursortarget;

if ((_target iskindof "zombie") && (damage _target) >= 1) then {

    _deadzed = true;

    if (_deadzed)exitwith{};
};
        _deadzed //return
