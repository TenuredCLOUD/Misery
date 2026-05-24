#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Radiation trauma tracker for ACE medical API
 * Used for Radiation damage to simulate Acute Radiation sickness
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handleRadiationExposure;
 *
*/

params ["_unit"];

private _openWounds = _unit getVariable [QACEGVAR(medical,openWounds), createHashMap];

private _bodyWounds = _openWounds getOrDefault ["body", []];

private _largeBruiseCount = 0;
private _largeBurnCount = 0;

{
    if ((_x select 0) isEqualTo 22) then {
        _largeBruiseCount = _largeBruiseCount + (_x select 1);
    };

    if ((_x select 0) isEqualTo 82) then {
        _largeBurnCount = _largeBurnCount + (_x select 1);
    };
} forEach _bodyWounds;

if (_largeBruiseCount >= 10 && _largeBurnCount >= 10) then {
    [_unit] call ACEFUNC(medical_statemachine,enteredStateCardiacArrest);
};
