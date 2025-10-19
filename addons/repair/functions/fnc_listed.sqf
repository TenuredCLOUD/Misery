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
 * [] call misery_repair_fnc_listed;
 *
 * Public: No
*/

[{!isNull findDisplay 982386},
{

    private _list = findDisplay 982386 displayCtrl 1500;

    [player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

    if (_nearestVehicle isEqualTo []) exitWith {
        [982386, [1600], false] call EFUNC(common,displayShowControls);
    };

    lbClear _list;

    private _repairPrice = 0;
    private _found = false;

    {
        if ((_x select 0) isEqualTo _nearestVehicle) then {
            private _array = _x;
            _found = true;
            _repairPrice = _x select 3;
        };
    } forEach EGVAR(common,vehicleData);

    if !(_found) exitWith {};

    private _index = _list lbAdd format ["Repair (%1)", _repairPrice];

}, []] call CBA_fnc_waitUntilAndExecute;



