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

[{!isNull findDisplay 982384}, {
    private _list = findDisplay 982384 displayCtrl 1500;
    private _purchaseButton = findDisplay 982384 displayCtrl 1600;

    if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _purchaseButton ctrlShow false;
    };

    private _vehicleName = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

    lbClear _list;

    private _fuelCost = 0;
    private _found = false;
    private _totalLiters = 0;

    {
        if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
            _found = true;
            private _fuelTypeIndex = _x select 1;
            _fuelCost = GVAR(fuelCosts) select _fuelTypeIndex;
            _totalLiters = _x select 2;
        };
    } forEach EGVAR(common,vehicleData);

    if !(_found) exitWith {};

    private _index = _list lbAdd format ["Refuel (%1/L) %2L", _fuelCost, _totalLiters];

}, []] call CBA_fnc_waitUntilAndExecute;







