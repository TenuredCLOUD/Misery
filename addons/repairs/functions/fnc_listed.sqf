#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Mechanic Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_repairs_fnc_listed;
 *
 * Public: No
*/

waitUntil {!isNull findDisplay 982382};

if (!isNull findDisplay 982382) exitWith {

    private ["_list","_PurchaseB","_Vehiclename","_repairPrice","_Found","_index"];

    _list = findDisplay 982382 displayCtrl 1500;
    _PurchaseB = findDisplay 982382 displayCtrl 1600;

    if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _PurchaseB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

    lbClear _list;

    if (isNil "_Vehiclename") exitWith {};

    _repairPrice = 0;
    _Found = false;

    {
        if ((_x select 0) == EGVAR(common,targetVehicleType)) then {
            _Array=_x;
            _Found = true;
            _repairPrice = _x select 3;
        };
    } forEach Misery_Veh_Type;

    if !(_Found) exitWith {};

    _index = _list lbAdd format ["Repair (%1)", _repairPrice];
};


