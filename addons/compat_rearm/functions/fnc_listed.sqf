#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Resupply Vehicle Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_rearm_fnc_listed;
 *
 * Public: No
*/

[{!isNull findDisplay 982383},
{
    private _list = findDisplay 982383 displayCtrl 1500;

    [player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

    if (_nearestVehicle isEqualTo []) exitWith {
        [982383, [1600], false] call EFUNC(common,displayShowControls);
    };

    lbClear _list;

    private _resupplyPrice = 0;
    private _found = false;

    {
        if ((_x select 0) isEqualTo _nearestVehicle) then {
            _array = _x;
            _found = true;
            _resupplyPrice = _x select 4;
        };
    } forEach EGVAR(common,vehicleData);

    if !(_found) exitWith {};

    private _formattedPrice = _resupplyPrice;
    private _index = 0;

    if (_resupplyPrice isEqualTo -1) then {
        _index = _list lbAdd "This vehicle cannot be resupplied...";
        [982383, [1600], false] call EFUNC(common,displayShowControls);
    } else {
        _index = _list lbAdd format ["Resupply (%1)", _formattedPrice];
    };
}, []] call CBA_fnc_waitUntilAndExecute;





