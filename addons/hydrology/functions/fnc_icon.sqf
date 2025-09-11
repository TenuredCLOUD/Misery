#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * hydrology Icon updater
 * Updates icons in water collection GUI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_hydrology_fnc_icon;
 *
 * Public: No
*/

disableSerialization;

[{!isNull findDisplay 982380},
{
    [{
        params ["_args", "_handle"];
        if ( isNull findDisplay 982380 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _dialog = findDisplay 982380;
        private _list = _dialog displayCtrl 1500;
        private _currselection = lbCurSel _list;
        private _selectedItem = _list lbData _currselection;
        private _IconCtrl = _dialog displayCtrl 1200;

        [_selectedItem] call EFUNC(common,getItemData) params ["", "_picture"];
        _IconCtrl ctrlSetText _picture;

    }, 0, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
