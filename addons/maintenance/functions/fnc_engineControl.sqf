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

    private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
    private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
    private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
    private _vehicleClass = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "vehicleClass");

    switch (true) do {
        // Vehicle has batteries but less than required - Will randomly kill engine
        case ((_installedBatteries > 0) && _installedBatteries < _requiredBatteries): {
            if (random 1 > 0.5) then {
                private _engineStuttersTip = format ["The engine sputters due insufficient battery count: (%1/%2)", _installedBatteries, _requiredBatteries];
                [_engineStuttersTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
            };
        };
        // Vehicle has sufficient batteries and charge
        default {
            // Drain battery on engine start attempt
            if (inputAction "engineToggle" > 0 && !isEngineOn _vehicle) then {
                if (_installedBatteries >= _requiredBatteries && _batteryLevel > 0) then {
                    private _newBatteryLevel = _batteryLevel - (10 / _requiredBatteries); // Drain 10% per battery on start
                    _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel max 0, true];
                };
                // Trickle charge when engine is running
                if (isEngineOn _vehicle) then {
                    private _newBatteryLevel = _batteryLevel + (0.05 / _requiredBatteries);
                    _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel min 1, true];
                };
            };
        };
    };
};

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle"];

    _vehicle addEventHandler ["Engine", {
	    params ["_vehicle", "_engineState"];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        if (_installedBatteries isEqualTo 0) exitWith {
            if (_engineState isEqualTo true) then {
                _vehicle engineOn false;
                //private _cannotStartTip = format ["Cannot start engine: (%1/%2) batteries, %3%% charge.", _installedBatteries, _requiredBatteries, _batteryLevel];
                //[_cannotStartTip, 1, [1, 1, 1, 1], true] call CBA_fnc_notify;
            };
        };

        if (_batteryLevel <= 0) exitWith {
            if (_engineState isEqualTo true) then {
                _vehicle engineOn false;
                //private _cannotStartTip = format ["Cannot start engine: (%1/%2) batteries, %3%% charge.", _installedBatteries, _requiredBatteries, _batteryLevel];
                //[_cannotStartTip, 1, [1, 1, 1, 1], true] call CBA_fnc_notify;
            };
        };
    }];

    _vehicle addEventHandler ["VisionModeChanged", {
	    params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        if (_installedBatteries > 0 && _batteryLevel > 0) exitWith {
            equipmentDisabled _vehicle params ["_nvg","_ti"];
            if (_nvg isEqualTo true) then {
                _vehicle disableNVGEquipment false;
            };
            if (_ti isEqualTo true) then {
                _vehicle disableTIEquipment false;
            };
        };

        if ((_installedBatteries isEqualTo 0 || _batteryLevel <= 0) && _visionMode isNotEqualTo 0) then {
            _vehicle disableTIEquipment true;
            _vehicle disableNVGEquipment true;
        };
    }];

    if (_role in ["driver", "pilot"] && isPlayer _unit) then {
        [GVAR(handleEngine), 0.1, []] call CBA_fnc_addPerFrameHandler;
        call FUNC(vehicleStats);
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle"];

    if (_role in ["driver", "pilot"] && isPlayer _unit) then {
        [GVAR(engineHandle)] call CBA_fnc_removePerFrameHandler;
    };
}];
