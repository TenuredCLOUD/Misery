#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Listener that intercepts ACE refuel events to enforce fuel types
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_refuelRestrictions;
 */

[QCLASSACE(refuel_started), {
    params ["_source", "_target", "_nozzle", "_unit"];

    private _pumpAllowedFuels = _source getVariable [QGVAR(fuelTypeSupported), []];

    // If target is a generator & source isn't jetfuel allow refilling
    if (typeOf _target in EGVAR(power,generators) && [0, 1] in [_pumpAllowedFuels]) exitWith {};

    if (_pumpAllowedFuels isNotEqualTo []) then {

        private _found = false;
        private _vehicleFuelIndex = -1;

        {
            if ((_x select 0) isEqualTo typeOf _target) then {
                _found = true;
                _vehicleFuelIndex = _x select 1;
            };
        } forEach EGVAR(common,vehicleData);

        if (!_found) exitWith {
            // short delay to make sure nozzle sound is terminated
            [{
                params ["_unit", "_nozzle"];
                [_unit, _nozzle] call ACEFUNC(refuel,turnOff);
            }, [_unit, _nozzle], 0.2] call CBA_fnc_waitAndExecute;
        };

        if !(_vehicleFuelIndex in _pumpAllowedFuels) then {

            // short delay to make sure nozzle sound is terminated
            [{
                params ["_unit", "_nozzle"];
                [_unit, _nozzle] call ACEFUNC(refuel,turnOff);
            }, [_unit, _nozzle], 0.2] call CBA_fnc_waitAndExecute;

            private _reqString = "";

            switch (_vehicleFuelIndex) do {
                case 0: { _reqString = localize LSTRING(Diesel) };
                case 1: { _reqString = localize LSTRING(Petrol) };
                case 2: { _reqString = localize LSTRING(JetFuel) };
            };

            private _msg = format [localize LSTRING(PumpDoesNotDispense), _reqString];
            [[_msg, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
        };
    };
}] call CBA_fnc_addEventHandler;
