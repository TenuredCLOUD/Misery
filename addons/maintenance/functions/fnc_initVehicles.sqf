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

["AllVehicles", "Init", {
    private _vehicleClasses = [];
    {
        _vehicleClasses pushBack (_x select 0);
    } forEach EGVAR(common,vehicleData);

    private _vehicleType = typeOf (_this select 0);
    if (_vehicleType in _vehicleClasses) then {
        private _vehicleData = EGVAR(common,vehicleData) select {(_x select 0) isEqualTo _vehicleType};
        private _batteryCount = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 6} else {1};
        private _batteryType = if (_vehicleData isNotEqualTo []) then {_vehicleData select 0 select 5} else {"misery_autoBattery"};
        (_this select 0) setVariable [QGVAR(batteryCount), _batteryCount, true];
        (_this select 0) setVariable [QGVAR(batteryType), _batteryType, true];
        (_this select 0) setVariable [QGVAR(installedBatteries), 0, true];
        (_this select 0) setVariable [QGVAR(batteryLevel), 0, true];
        (_this select 0) setVariable [QGVAR(oilLevel), 0, true];
        (_this select 0) setVariable [QGVAR(coolantLevel), 0, true];
        if (GVAR(fuelOnStart) > 0) then {
            (_this select 0) setFuel (random GVAR(fuelOnStart));
        };
        if (GVAR(damageOnStart) > 0) then {
            private _hitPoints = getAllHitPointsDamage (_this select 0) select 0;
            {
                (_this select 0) setHitPointDamage [_x, random GVAR(damageOnStart)];
            } forEach _hitPoints;
        };
        if (GVAR(preparedTools)) then {
            [(_this select 0)] call FUNC(preparedVehicle);
        };
    };
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
