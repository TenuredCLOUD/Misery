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

    [player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

    if (_nearestVehicle isEqualTo []) exitWith {
        [982384, [1600], false] call EFUNC(common,displayShowControls);
    };

    lbClear _list;

    private _fuelCost = 0;
    private _found = false;
    private _totalLiters = 0;

    {
        if ((_x select 0) isEqualTo _nearestVehicle) then {
            _found = true;
            private _fuelTypeIndex = _x select 1;
            _fuelCost = GVAR(fuelCosts) select _fuelTypeIndex;
            _totalLiters = _x select 2;
        };
    } forEach EGVAR(common,vehicleData);

    if !(_found) exitWith {};

    private _index = _list lbAdd format ["Refuel (%1/L) %2L", _fuelCost, _totalLiters];

}, []] call CBA_fnc_waitUntilAndExecute;







