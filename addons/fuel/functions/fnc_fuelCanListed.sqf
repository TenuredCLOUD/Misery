#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Fuel can filling list processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_fuelCanListed
 *
*/

[{!isNull findDisplay 733836}, {
    private _list = findDisplay 733836 displayCtrl 1500;

    lbClear _list;

    if ([[MACRO_FUELSTATIONS_LAND], 2.5] call EFUNC(common,nearCraftingStation)) exitWith {
        {
            private _outputItem = _x;
            [_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

            private _index = _list lbAdd _displayName;
            _list lbSetData [_index, _outputItem];
        } forEach [QCLASS(petrol), QCLASS(diesel)];
    };

    if ([[MACRO_FUELSTATIONS_AIR], 5] call EFUNC(common,nearCraftingStation)) exitWith {
        [QCLASS(jetFuel)] call EFUNC(common,getItemData) params ["_displayName"];

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, QCLASS(jetFuel)];
    };
}, []] call CBA_fnc_waitUntilAndExecute;
