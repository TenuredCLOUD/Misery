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

private _target = cursorTarget;

if ((_target isKindOf "zombie") && (damage _target) >= 1) then {

    _deadzed = true;

    if (_deadzed)exitWith{};
};
        _deadzed //return
