#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Hydrology List Populator
 * Populates list of fillable containers in GUI
 *
 * Arguments:
 * 0: Active source containers <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_containersListed;
 *
 * Public: No
*/

params [["_recipes", createHashMap, [createHashMap]]];

[{!isNull findDisplay 982380}, {
    params ["_recipes"];

    private _list = findDisplay 982380 displayCtrl 1500;
    [982380, [1010], false] call EFUNC(common,displayShowControls);
    lbClear _list;

    {
        private _requiredItem = _x;

        [_requiredItem] call EFUNC(common,getItemData) params ["_displayName"];

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _requiredItem];
    } forEach _recipes;
}, [_recipes]] call CBA_fnc_waitUntilAndExecute;
