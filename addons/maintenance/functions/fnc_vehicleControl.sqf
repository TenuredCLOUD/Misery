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
    private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
    private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];
    private _currentEngineDamage = _vehicle getHitPointDamage "hitEngine";

    if (isEngineOn _vehicle) then {
        if (_currentOilLevel < 0.75 || _currentCoolantLevel < 0.75) then {
            _vehicle setHitPointDamage ["hitEngine", _currentEngineDamage + 0.001];
        };
        if (_currentEngineDamage > 0.25) then {
            _vehicle setVariable [QGVAR(oilLevel), _currentOilLevel - 0.001];
            _vehicle setVariable [QGVAR(coolantLevel), _currentCoolantLevel - 0.001];
            if (_currentOilLevel <= 0) then {
                _vehicle setVariable [QGVAR(oilLevel), 0];
            };
            if (_currentCoolantLevel <= 0) then {
                _vehicle setVariable [QGVAR(coolantLevel), 0];
            };
        };
        if (_currentEngineDamage < 0.5) then {
            _vehicle setVariable [QGVAR(batteryLevel), (_batteryLevel + 0.005) min 1];
        } else {
            _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel - 0.001];
            if (_batteryLevel <= 0) then {
                _vehicle setVariable [QGVAR(batteryLevel), 0];
            };
        };
    };

    if ((_installedBatteries > 0) && _installedBatteries < _requiredBatteries) then {
        if ([50] call EFUNC(common,rollChance)) then {
            _vehicle engineOn false;
        };
    };

    if (inputAction "engineToggle" isEqualTo 1 && !isEngineOn _vehicle) then {
        if (_installedBatteries >= _requiredBatteries && _batteryLevel > 0) then {
            private _newBatteryLevel = _batteryLevel - (0.1 / _requiredBatteries);
            _vehicle setVariable [QGVAR(batteryLevel), _newBatteryLevel max 0];
        };
    };

    if (isLightOn _vehicle && !isEngineOn _vehicle) then {
        _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel - 0.001];
        if (_batteryLevel <= 0) then {
            _vehicle setVariable [QGVAR(batteryLevel), 0];
        };
    };
};

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle"];

    if (_unit isEqualTo (currentPilot _vehicle)) then {
        _unit setVariable [QGVAR(isPilot), true];
    } else {
        _unit setVariable [QGVAR(isPilot), false];
    };

    if (typeOf _vehicle in MACRO_TANK_CLASSES) then {

        private _turretPath = _vehicle unitTurret _unit;
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

        if (_batteryLevel <= 0 && {_turretPath isNotEqualTo [-1]}) then {
            _vehicle setTurretLimits [_turretPath, 0, 0, 0, 0];
        } else {
            _vehicle setTurretLimits [[0]]; // reset turret to config defaults
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
                        _vehicle setTurretLimits [[0]]; // reset turret to config defaults
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

    GVAR(handleVehicleEngine) = _vehicle addEventHandler ["Engine", {
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

    GVAR(handleVehicleVision) = _vehicle addEventHandler ["VisionModeChanged", {
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

    if !(isNull objectParent _unit) then {
        [GVAR(handleEngine), 0.1, []] call CBA_fnc_addPerFrameHandler;
        call FUNC(vehicleStats);
    };

    GVAR(trackPlayerSeats) = _unit addEventHandler ["SeatSwitchedMan", {
        params ["_unit1", "_unit2", "_vehicle"];
        if (_unit1 isEqualTo player || _unit2 isEqualTo player) then {
            if (player isEqualTo (currentPilot _vehicle)) then {
                player setVariable [QGVAR(isPilot), true];
            } else {
                player setVariable [QGVAR(isPilot), false];
            };
        };
    }];

    _vehicle addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret", "_isEject"];

        if (_unit getVariable [QGVAR(isPilot), false] && {isLightOn _vehicle}) then {
            [{
                params ["_vehicle", "_unit"];

                _unit action ["LightOff", _vehicle];
            }, [_vehicle, _unit], 0.02] call CBA_fnc_waitAndExecute;
        };

        _unit setVariable [QGVAR(isPilot), nil];

        if (isNull objectParent _unit) then {
            [GVAR(engineHandle)] call CBA_fnc_removePerFrameHandler;
            removeUserActionEventHandler ["headlights", "Activate", GVAR(handleLights)];

            if (!isNil QGVAR(handleOptics)) then {
                _unit removeEventHandler ["OpticsSwitch", GVAR(handleOptics)];
            };
            if (!isNil QGVAR(trackPlayerSeats)) then {
                _unit removeEventHandler ["SeatSwitchedMan", GVAR(trackPlayerSeats)];
            };
            if (!isNil QGVAR(handleTurret)) then {
                _vehicle removeEventHandler ["SeatSwitched", GVAR(handleTurret)];
            };
            if (!isNil QGVAR(handleVehicleVision)) then {
                _vehicle removeEventHandler ["VisionModeChanged", GVAR(handleVehicleVision)];
            };
            if (!isNil QGVAR(handleVehicleEngine)) then {
                _vehicle removeEventHandler ["Engine", GVAR(handleVehicleEngine)];
            };
        };

        // Sync vehicle vars to network to avoid network saturation
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
        private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
        private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

        _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel, true];
        _vehicle setVariable [QGVAR(oilLevel), _currentOilLevel, true];
        _vehicle setVariable [QGVAR(coolantLevel), _currentCoolantLevel, true];

        _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
    }];
}];
