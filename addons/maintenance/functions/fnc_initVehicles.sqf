#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes vehicles with batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_initVehicles;
 *
 * Public: No
*/

if (isNil QEGVAR(common,vehicleData)) then {
    EGVAR(common,vehicleData) = [];
};

["AllVehicles", "Init", {
    params ["_vehicle"];
    private _vehicleName = typeOf _vehicle;

    private _existingEntry = EGVAR(common,vehicleData) findIf {(_x select 0) isEqualTo _vehicleName};
    private _data = [];

    private _fuelType = 0;
    private _fuelLiters = 100;
    private _coolantLiters = 10;
    private _oilLiters = 8;
    private _batteryType = 0;
    private _batteryCount = 1;
    private _maxCargoMass = 500;
    private _repairPrice = 5000;
    private _resupplyPrice = 15000;

    private _maintConfig = missionConfigFile >> "CfgMisery_VehicleData" >> _vehicleName;
    private _hasConfig = isClass _maintConfig;

    if (_hasConfig) then {
        _fuelType = getNumber (_maintConfig >> "fuelType");
        _fuelLiters = getNumber (_maintConfig >> "fuelLiters");
        _coolantLiters = getNumber (_maintConfig >> "coolantLiters");
        _oilLiters = getNumber (_maintConfig >> "oilLiters");
        _batteryType = getNumber (_maintConfig >> "batteryType");
        _batteryCount = getNumber (_maintConfig >> "batteryCount");
        _maxCargoMass = getNumber (_maintConfig >> "maxCargoMass");
        _repairPrice = getNumber (_maintConfig >> "repairPrice");
        _resupplyPrice = getNumber (_maintConfig >> "resupplyPrice");
    } else {
        private _vehicleConfig = configFile >> "CfgVehicles" >> _vehicleName;
        private _fuelCapacity = getNumber (_vehicleConfig >> "fuelCapacity");

        if (_fuelCapacity <= 0) then {
            _fuelCapacity = 100;
        };

        if (_vehicle isKindOf "Helicopter" || _vehicle isKindOf "Plane") then {
            _fuelType = 2;
        } else {
            if (_vehicle isKindOf "Tank") then {
                _fuelType = 0;
            } else {
                _fuelType = 1;
            };
        };

        _fuelLiters = _fuelCapacity;
        _coolantLiters = round (_fuelCapacity / 12);
        _oilLiters = round (_fuelCapacity / 15);

        if (_vehicle isKindOf "Tank") then {
            _batteryType = 1;
            _batteryCount = 4;
        } else {
            if (getNumber (_vehicleConfig >> "transportSoldier") >= 6) then {
                _batteryCount = 2;
            };
            if (_vehicle isKindOf "Air") then {
                _batteryType = 1;
            };
        };

        private _mass = getNumber (_vehicleConfig >> "maximumLoad");
        if (_mass > 0) then {
            _maxCargoMass = _mass;
        } else {
            if (getNumber (_vehicleConfig >> "transportSoldier") >= 6) then {
                _maxCargoMass = 5000 + (getNumber (_vehicleConfig >> "transportSoldier") * 100);
            } else {
                if (getNumber (_vehicleConfig >> "transportSoldier") < 6) then {
                    _maxCargoMass = 500;
                };
                if (getNumber (_vehicleConfig >> "transportSoldier") < 2) then {
                    _maxCargoMass = 50;
                };
            };
        };
    };

    _data = [_vehicleName, _fuelType, _fuelLiters, _repairPrice, _resupplyPrice, _batteryType, _batteryCount, _coolantLiters, _oilLiters];

    if (_existingEntry isEqualTo -1) then {
        EGVAR(common,vehicleData) pushBack _data;
        publicVariable QEGVAR(common,vehicleData);
    } else {
        EGVAR(common,vehicleData) set [_existingEntry, _data];
    };

    _vehicle setVariable [QGVAR(batteryCount), _batteryCount, true];
    _vehicle setVariable [QGVAR(batteryType), _batteryType, true];
    _vehicle setVariable [QGVAR(installedBatteries), 0, true];
    _vehicle setVariable [QGVAR(batteryLevel), 0, true];
    _vehicle setVariable [QGVAR(oilLevel), 0, true];
    _vehicle setVariable [QGVAR(coolantLevel), 0, true];

    if (GVAR(fuelOnStart) > 0) then {
        _vehicle setFuel (random GVAR(fuelOnStart));
    };

    if (GVAR(damageOnStart) > 0) then {
        private _hitPoints = getAllHitPointsDamage _vehicle select 0;
        {
            _vehicle setHitPointDamage [_x, random GVAR(damageOnStart)];
        } forEach _hitPoints;
    };

    if (GVAR(preparedTools)) then {
        [_vehicle] call FUNC(preparedVehicle);
    };
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
