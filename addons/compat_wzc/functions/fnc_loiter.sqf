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

[{GVAR(registeredEntities) isNotEqualTo []}, {
    {
        private _group = _x;
        private _leader = leader _group;
        private _randomPos = [position _leader, 50] call CBA_fnc_randPos;

        _group move _randomPos;
    } forEach GVAR(registeredEntities);
    [{
        [] call FUNC(loiter);
    }, [], 15] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
