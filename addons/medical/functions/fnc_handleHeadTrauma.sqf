#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Head trauma tracker for ACE medical API
 * Used to simulate internal brain damage from repeated blows in certain systems (Psychosis & Cognito Hazards)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handleHeadTrauma;
 *
*/

params ["_unit"];

private _openWounds = _unit getVariable [QACEGVAR(medical,openWounds), createHashMap];

private _headWounds = _openWounds getOrDefault ["head", []];

private _largeBruiseCount = 0;

{
    if ((_x select 0) isEqualTo 22) then {
        _largeBruiseCount = _largeBruiseCount + (_x select 1);
    };
} forEach _headWounds;

if (_largeBruiseCount >= 10) then {
    [_unit] call ACEFUNC(medical_statemachine,enteredStateCardiacArrest);
};
