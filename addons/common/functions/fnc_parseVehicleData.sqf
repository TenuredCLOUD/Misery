#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * vehicle data parser / retrieval from description.ext for CfgMisery_VehicleData class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_parseVehicleData;
 *
*/

GVAR(vehicleData) = [];
{
    private _vehicleName = configName _x;
    private _fuelType = getNumber (_x >> "fuelType");
    private _fuelLiters = getNumber (_x >> "fuelLiters");
    private _coolantLiters = getNumber (_x >> "coolantLiters");
    private _oilLiters = getNumber (_x >> "oilLiters");
    private _repairPrice = getNumber (_x >> "repairPrice");
    private _resupplyPrice = getNumber (_x >> "resupplyPrice");
    private _batteryType = getNumber (_x >> "batteryType");
    private _batteryCount = getNumber (_x >> "batteryCount");
    GVAR(vehicleData) pushBack [_vehicleName, _fuelType, _fuelLiters, _repairPrice, _resupplyPrice, _batteryType, _batteryCount, _coolantLiters, _oilLiters];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_VehicleData"));

// Broadcast the vehicle data across all clients
publicVariable QGVAR(vehicleData);
