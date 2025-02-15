#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Refuel Vehicle Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_refuel_fnc_refuelListed;
 *
 * Public: No
*/

[{!isNull findDisplay 982384},
{

    private ["_list","_PurchaseB","_Vehiclename","_fuelCost","_Found","_totalLiters","_index","_fuelTypeIndex"];

    _list = findDisplay 982384 displayCtrl 1500;
    _PurchaseB = findDisplay 982384 displayCtrl 1600;

    if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _PurchaseB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

    lbClear _list;

    _fuelCost = 0;
    _Found = false;
    _totalLiters = 0;

    {
        if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
            _Array=_x;
            _Found = true;
            _fuelTypeIndex = _x select 1;

            _fuelCost = (GVAR(fuelCosts) select 0) select _fuelTypeIndex;

            _totalLiters = _x select 2;
        };
    } forEach Misery_Veh_Type;

    if !(_Found) exitWith {};

    _index = _list lbAdd format ["Refuel (%1/L) %2L", _fuelCost,_totalLiters];

}, []] call CBA_fnc_waitUntilAndExecute;







