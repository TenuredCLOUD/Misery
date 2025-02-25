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
    private _liters = getNumber (_x >> "liters");
    private _repairPrice = getNumber (_x >> "repairPrice");
    private _resupplyPrice = getNumber (_x >> "resupplyPrice");
    GVAR(vehicleData) pushBack [_vehicleName, _fuelType, _liters, _repairPrice, _resupplyPrice];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_VehicleData"));

// Broadcast the vehicle data across all clients
publicVariable QGVAR(vehicleData);
