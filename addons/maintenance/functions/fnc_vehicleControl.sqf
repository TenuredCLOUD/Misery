#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Control Handler
 * Enables or disables vehicle features based on available power
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_vehicleControl;
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

    if ((_installedBatteries > 0) && _installedBatteries < _requiredBatteries) then {
        if (random 1 > 0.5) then {
            _vehicle engineOn false;
        };
    };

    if (inputAction "engineToggle" isEqualTo 1 && !isEngineOn _vehicle) then {
        if (_installedBatteries >= _requiredBatteries && _batteryLevel > 0) then {
            private _newBatteryLevel = _batteryLevel - (0.1 / _requiredBatteries);
            _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel max 0, true];
        };
    };

    if (isEngineOn _vehicle) then {
        if (_vehicle getHitPointDamage "hitEngine" < 0.5) then {
            private _chargingBatteryLevel = _batteryLevel + (0.05 / _requiredBatteries);
            _vehicle setVariable [QGVAR(batteryLevel), _chargingBatteryLevel min 1, true];
        } else {
            private _drainBatteryLevel = _batteryLevel - (0.05 / _requiredBatteries);
            _vehicle setVariable [QGVAR(batteryLevel), _drainBatteryLevel, true];
            if (_batteryLevel <= 0) then {
                _vehicle setVariable [QGVAR(batteryLevel), 0, true];
            };
        };
    };

    if (isLightOn _vehicle) then {
        private _drainBatteryLevelLights = _batteryLevel - (0.001 / _requiredBatteries);
        _vehicle setVariable [QGVAR(batteryLevel), _drainBatteryLevelLights, true];
        if (_batteryLevel <= 0) then {
            _vehicle setVariable [QGVAR(batteryLevel), 0, true];
        };
    };
};

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle"];

    if (typeOf _vehicle in MACRO_TANK_CLASSES) then {

        private _turretPath = _vehicle unitTurret _unit;
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        if (_batteryLevel <= 0 && {_turretPath isNotEqualTo [-1]}) then {
            _vehicle setTurretLimits [_turretPath, 0, 0, 0, 0];
        } else {
            _vehicle setTurretLimits [_turretPath];
        };

        GVAR(handleTurret) = _vehicle addEventHandler ["SeatSwitched", {
            params ["_vehicle", "_unit1", "_unit2"];

            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

            {
                private _turretPath = _vehicle unitTurret _x;
                if (_turretPath isNotEqualTo [-1]) then {
                    if (_batteryLevel <= 0) then {
                        _vehicle setTurretLimits [_turretPath, 0, 0, 0, 0];
                    } else {
                        _vehicle setTurretLimits [_turretPath];
                    };
                };
            } forEach [_unit1, _unit2];
        }];

        GVAR(handleOptics) = _unit addEventHandler ["OpticsSwitch", {
	        params ["_unit", "_isADS"];

            private _vehicle = vehicle _unit;
            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

            if (_batteryLevel > 0) exitWith {};

            if (_isADS && gunner _vehicle isEqualTo _unit || commander _vehicle isEqualTo _unit) then {
                _unit switchCamera "Internal";
            };
        }];
    };

    GVAR(handleLights) = addUserActionEventHandler ["headlights", "Activate", {
        params ["_activated"];

        private _vehicle = vehicle player;
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        if (_activated) then {
            [{
                params ["_vehicle", "_batteryLevel"];

                if (_batteryLevel <= 0 && isLightOn _vehicle) then {
                    player action ["LightOff", _vehicle];
                };
            }, [_vehicle, _batteryLevel], 0.02] call CBA_fnc_waitAndExecute;
        };
    }];

    _vehicle addEventHandler ["Engine", {
	    params ["_vehicle", "_engineState"];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        private _found = false;
        private _batteryCount = 0;

        {
            if ((_x select 0) isEqualTo typeOf _vehicle) then {
                _array = _x;
                _found = true;
                _batteryCount = _x select 6;
            };
        } forEach EGVAR(common,vehicleData);

        if !(_found) exitWith {};

        if (_batteryCount > 0 && _installedBatteries isEqualTo 0) exitWith {
            if (_engineState isEqualTo true) then {
                _vehicle engineOn false;
            };
        };

        if (_batteryCount > 0 && _batteryLevel <= 0) exitWith {
            if (_engineState isEqualTo true) then {
                _vehicle engineOn false;
            };
        };
    }];

    _vehicle addEventHandler ["VisionModeChanged", {
	    params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
        private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        private _found = false;
        private _batteryCount = 0;

        {
            if ((_x select 0) isEqualTo typeOf _vehicle) then {
                _array = _x;
                _found = true;
                _batteryCount = _x select 6;
            };
        } forEach EGVAR(common,vehicleData);

        if !(_found) exitWith {};

        if (_batteryCount > 0 && _installedBatteries > 0 && _batteryLevel > 0) exitWith {
            equipmentDisabled _vehicle params ["_nvg","_ti"];
            if (_nvg isEqualTo true) then {
                _vehicle disableNVGEquipment false;
            };
            if (_ti isEqualTo true) then {
                _vehicle disableTIEquipment false;
            };
        };

        if (_batteryCount > 0 && (_installedBatteries isEqualTo 0 || _batteryLevel <= 0) && _visionMode isNotEqualTo 0) then {
            _vehicle disableTIEquipment true;
            _vehicle disableNVGEquipment true;
        };
    }];

    if !(isNull objectParent player) then {
        [GVAR(handleEngine), 0.1, []] call CBA_fnc_addPerFrameHandler;
        call FUNC(vehicleStats);
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle"];

    if (isNull objectParent player) then {
        [GVAR(engineHandle)] call CBA_fnc_removePerFrameHandler;
        removeUserActionEventHandler ["headlights", "Activate", GVAR(handleLights)];

        if (!isNil QGVAR(handleOptics)) then {
            _unit removeEventHandler ["OpticsSwitch", GVAR(handleOptics)];
        };
        if (!isNil QGVAR(handleTurret)) then {
            _vehicle removeEventHandler ["SeatSwitched", GVAR(handleTurret)];
        };
    };
}];
