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
lbClear _list;

    {
        private _requiredItem = _x select 0;
        private _displayName = getText (configFile >> "CfgWeapons" >> _requiredItem >> "displayName");
        if (_displayName isEqualTo "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _requiredItem >> "displayName");
        };
        if (_displayName isEqualTo "") then {
            _displayName = _requiredItem;
        };

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _requiredItem];
    } forEach GVAR(recipes);
}, []] call CBA_fnc_waitUntilAndExecute;
