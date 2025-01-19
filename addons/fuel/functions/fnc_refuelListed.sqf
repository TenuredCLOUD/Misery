#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Refuel Vehicle JCan UI List populater
 * Defines the selected refuel option, and passes data
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_refuelListed
 *
*/

waitUntil {!isNull findDisplay 982385};

if (!isNull findDisplay 982385) exitWith {

    private ["_list","_PurchaseB","_Vehiclename","_Found","_totalLiters","_index","_fuelTypeIndex"];

    _list = findDisplay 982385 displayCtrl 1500;
    _PurchaseB = findDisplay 982385 displayCtrl 1600;

    if (isNil "EGVAR(common,targetVehicleType)") exitWith {
        _index = _list lbAdd "No vehicle to refuel...";
        _PurchaseB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

    lbClear _list;

    _Found = false;
    _totalLiters = 0;

    {
        if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
            _Array=_x;
            _Found = true;
            _fuelTypeIndex = _x select 1;

            _totalLiters = _x select 3;
        };
    } forEach Misery_Veh_Type;

    if !(_Found) exitWith {};

    _index = _list lbAdd format ["Refuel %1 %2L", _Vehiclename,_totalLiters];
};







