#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Engine Control Handler
 * Prevents engine start without sufficient batteries in vehicle inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_engineControl;
 *
 * Public: No
*/

GVAR(handleEngine) = {
    params ["_args", "_handle"];

    private _vehicle = vehicle player;

    GVAR(engineHandle) = _handle;

    private _requiresBattery = _vehicle getVariable [QGVAR(requiresBattery), true];
    private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
    private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
    private _vehicleClass = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "vehicleClass");

    // Count batteries in vehicle (pseudo-battery system)
    [_vehicle, _batteryType] call FUNC(countBatteries) params ["_installedBatteries"];

    if (_installedBatteries > 0) then {
        _vehicle setVariable [QGVAR(requiresBattery), false, true];
    };

    // Store original fuel level if not already stored / WIP needs to update while driving to continually update it for when vehicle is exited otherwise fuel never drains
    if (isNil {_vehicle getVariable QGVAR(originalFuel)}) then {
        _vehicle setVariable [QGVAR(originalFuel), fuel _vehicle, true];
    };

    // Default: keep fuel active
    _vehicle setFuel (_vehicle getVariable [QGVAR(originalFuel), 1]);

    switch (true) do {
        // Vehicle requires battery
        case (_requiresBattery): {
            _vehicle setFuel 0;
            if (inputAction "engineToggle" > 0) then {
                private _cannotStartTip = format ["Cannot start engine: (%1/%2) batteries, %3%% charge.", _installedBatteries, _requiredBatteries, _batteryLevel];
                [_cannotStartTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
            };
        };
        // Vehicle has batteries but less than required - Will randomly kill engine
        case (!_requiresBattery && _installedBatteries < _requiredBatteries): {
            if (random 1 > 0.5) then {
                _vehicle setFuel 0;
                private _engineStuttersTip = format ["The engine sputters due insufficient battery count: (%1/%2)", _installedBatteries, _requiredBatteries];
                [_engineStuttersTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
            };
        };
        // Vehicle has batteries but no charge
        case (!_requiresBattery && _batteryLevel <= 0): {
            _vehicle setFuel 0;
        };
        // Vehicle has sufficient batteries and charge
        default {
            // Drain battery on engine start attempt
            if (inputAction "engineToggle" > 0 && !isEngineOn _vehicle) then {
                if (_installedBatteries >= _requiredBatteries && _batteryLevel > 0) then {
                    private _newBatteryLevel = _batteryLevel - (10 / _requiredBatteries); // Drain 10% per battery on start
                    _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel max 0, true];
                } else {
                    _vehicle setFuel 0;
                    hintSilent format ["Cannot start engine: %1/%2 batteries, %3%% charge.", _installedBatteries, _requiredBatteries, _batteryLevel];
                };
            };
            // Trickle charge when engine is running
            if (isEngineOn _vehicle) then {
                private _newBatteryLevel = _batteryLevel + (0.05 / _requiredBatteries);
                _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel min 100, true];
            };
        };
    };

    // Partial functionality for tanks, helicopters, planes
    if (_installedBatteries > 0 && _batteryLevel > 0 && _vehicleClass in ["Tank", "Helicopter", "Plane"]) then {
        private _batteryFraction = _installedBatteries / _requiredBatteries;
        if (_batteryFraction < 1) then {
            if (_vehicleClass isEqualTo "Tank") then {
                if (_batteryFraction < 0.5) then {
                    // Need to disable certain vehicle elements with very low battery
                };
                if (_batteryFraction < 0.75) then {
                    // Need turret locking functionality
                };
            };
            if (_vehicleClass in ["Helicopter", "Plane"]) then {
                if (_batteryFraction < 0.5) then {
                    // Need to disable certain vehicle elements with very low battery
                };
            };
        } else {
            // If battery charge is okay, remove vehicle restrictions
        };
    };
};

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle"];

    if (_role in ["driver", "pilot"] && isPlayer _unit) then {
        [GVAR(handleEngine), 0.1, []] call CBA_fnc_addPerFrameHandler;
        call FUNC(vehicleStats);
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle"];

    if (_role in ["driver", "pilot"] && isPlayer _unit) then {

            [GVAR(engineHandle)] call CBA_fnc_removePerFrameHandler;
            // Restore fuel and clear original fuel variable
            _vehicle setFuel (_vehicle getVariable [QGVAR(originalFuel), 1]);
            _vehicle setVariable [QGVAR(originalFuel), nil, true];
    };
}];
