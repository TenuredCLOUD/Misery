#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Icon updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_crafting_fnc_showIcon;
 *
 * Public: No
*/

disableSerialization;

[{!isNull findDisplay 982376},
{
    [{
        params ["_args", "_handle"];
        if (isNull findDisplay 982376 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _dialog = findDisplay 982376;
        private _list = _dialog displayCtrl 1500;
        private _currselection = lbCurSel _list;
        private _selectedItem = _list lbData _currselection;
        private _IconCtrl = _dialog displayCtrl 1501;

        [_selectedItem] call EFUNC(common,getItemData) params ["", "_picture"];

        _IconCtrl ctrlSetText _picture;

    }, 0, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
