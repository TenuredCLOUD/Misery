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

[{!isNull findDisplay 274840}, {
private _list = findDisplay 274840 displayCtrl 1500;

private _progressBar = findDisplay 274840 displayCtrl 1010;
_progressBar ctrlShow false; // Hide progresss bar on GUI load

lbClear _list;

    {
        private _outputItem = _x select 0;

        [_outputItem] call EFUNC(common,getItemData) params ["_displayName", "_picture"];

        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _outputItem];
        _list lbSetPicture [_index, _picture];
    } forEach GVAR(data);
}, []] call CBA_fnc_waitUntilAndExecute;
