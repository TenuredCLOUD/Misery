#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Hydrology List Populator
 * Populates list of fillable containers in GUI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_containersListed;
 *
 * Public: No
*/

[{!isNull findDisplay 982380}, {
private _list = findDisplay 982380 displayCtrl 1500;

[982380, [1010], false] call EFUNC(common,displayShowControls);

lbClear _list;

    {
        private _requiredItem = _x select 0;

        [_requiredItem] call EFUNC(common,getItemData) params ["_displayName"];

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _requiredItem];
    } forEach GVAR(containers);
}, []] call CBA_fnc_waitUntilAndExecute;
