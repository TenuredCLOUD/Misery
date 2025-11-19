#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forces all registered zombie groups to ignore each other, otherwise they fight
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_preventInfighting;
 *
 * Public: No
*/

params ["_newGroup"];

if (GVAR(registeredEntities) isEqualTo []) exitWith {};

[{
    params ["_newGroup"];
    private _newUnits = (units _newGroup) select {alive _x};
    if (_newUnits isEqualTo []) exitWith {};

    {
        private _otherGroup = _x;
        if (_otherGroup isEqualTo _newGroup) then {continue};
        private _otherUnits = (units _otherGroup) select {alive _x};
        {
            private _unit = _x;
            { _unit forgetTarget _x; _x forgetTarget _unit; } forEach _otherUnits;
        } forEach _newUnits;
    } forEach GVAR(registeredEntities);

}, [_newGroup], 0.1] call CBA_fnc_waitAndExecute;
