#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Applies saved ACE fuel station states from stored hashmap
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_applyFuelStates;
 */

if (!isServer) exitWith {};

private _masterFuelMap = missionNamespace getVariable [QGVAR(pumpStates), createHashMap];

if (count _masterFuelMap isEqualTo 0) exitWith {};

private _activePumps = missionNamespace getVariable [QGVAR(activeFuelPumps), []];

if (count _activePumps isEqualTo 0) exitWith {};

{
    private _pump = _x;
    private _pumpPos = getPosASL _pump;

    {
        _y params ["_className", "_savedFuel", "_savedPosASL"];

        if ((typeOf _pump isEqualTo _className) && (_pumpPos distance _savedPosASL < 2)) exitWith {

            _pump setVariable [QGVAR(litreCargo), _savedFuel, true];
        };
    } forEach _masterFuelMap;
} forEach _activePumps;
