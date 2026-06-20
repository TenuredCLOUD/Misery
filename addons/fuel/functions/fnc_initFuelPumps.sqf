#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes fuel pumps that can be placed / dynamically spawned
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_initFuelPumps;
 *
 * Public: No
*/

{
    [_x, "Init", {
        params ["_pumpSource"];

        private _supportedFuels = [0, 1];

        _pumpSource setVariable [QGVAR(fuelTypeSupported), _supportedFuels, true];

        // Default to no fuel available to terminate nozzle pumping
        [_pumpSource, 0] call ACEFUNC(refuel,makeSource);

        [
            _pumpSource,
            "",
            0,
            {},
            {
                [_this select 0] call FUNC(turnOnPump);
            },
            {true},
            {
                [_this select 0] call FUNC(turnOffPump);
            },
            {true}
        ] call AE3FUNC(power,initDevice);

        [_pumpSource, nil, false] call AE3FUNC(power,initPowerInterface);

        // Set fuel pumps at 1.2kW for operation
        [_pumpSource, 0.000333, 0] call AE3FUNC(power,initConsumer);

    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_FUELSTATIONS_LAND];

{
    [_x, "Init", {
        params ["_pumpSource"];

        private _supportedFuels = [2];

        _pumpSource setVariable [QGVAR(fuelTypeSupported), _supportedFuels, true];

        // Default to no fuel available to terminate nozzle pumping
        [_pumpSource, 0] call ACEFUNC(refuel,makeSource);

        [
            _pumpSource,
            "",
            0,
            {},
            {
                [_this select 0] call FUNC(turnOnPump);
            },
            {true},
            {
                [_this select 0] call FUNC(turnOffPump);
            },
            {true}
        ] call AE3FUNC(power,initDevice);

        [_pumpSource, nil, false] call AE3FUNC(power,initPowerInterface);

        // Set fuel pumps at 1.2kW for operation
        [_pumpSource, 0.000333, 0] call AE3FUNC(power,initConsumer);

    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_FUELSTATIONS_AIR];
