#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge List Populator
 * Populates list of smeltable objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_outputsListed;
 *
 * Public: No
*/

[{!isNull findDisplay 982388}, {
private _list = findDisplay 982388 displayCtrl 1500;

[982388, [1010], false] call EFUNC(common,displayShowControls);

lbClear _list;

    {
        private _outputItem = _x select 0;
        private _displayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");
        if (_displayName isEqualTo "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");
        };
        if (_displayName isEqualTo "") then {
            _displayName = _outputItem;
        };
        private _picture = getText (configFile >> "CfgWeapons" >> _outputItem >> "picture");
        if (_picture isEqualTo "") then {
            _picture = getText (configFile >> "CfgMagazines" >> _outputItem >> "picture");
        };

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _outputItem];
        _list lbSetPicture [_index, _picture];
    } forEach GVAR(data);
}, []] call CBA_fnc_waitUntilAndExecute;
