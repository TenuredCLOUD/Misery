#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Simulates loitering logic for creatures
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_loiter;
 *
*/

[{
    params ["_args", "_handle"];

    if (GVAR(registeredEntities) isEqualTo []) exitWith {};

    {
        private _group = _x;
        private _leader = leader _group;
        private _randomPos = [position _leader, 50] call CBA_fnc_randPos;

        _group move _randomPos;
    } forEach GVAR(registeredEntities);
}, 15] call CBA_fnc_addPerFrameHandler;
