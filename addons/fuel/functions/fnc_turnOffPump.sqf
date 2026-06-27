#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pump turn off logic
 * Handles power logic & ACE refuel API hook
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_turnOffPump
*/

params ["_source"];

if (EGVAR(persistence,saveACEFuelStations)) then {
    private _remainingFuel = _source getVariable [QACEGVAR(refuel,currentFuelCargo), 0];

    _source setVariable [QGVAR(litreCargo), _remainingFuel, true];
};

[_source, 0] call ACEFUNC(refuel,makeSource);

true
