#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Refuel icon updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_icon;
 *
 * Public: No
*/

[{!isNull findDisplay 733835}, {
    [{
        params ["_args", "_handle"];

        if (isNull findDisplay 733835 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        [player] call EFUNC(common,nearVehicle) params ["", "_vehicle"];
        [_vehicle] call EFUNC(common,getObjectData) params ["_displayName", "_picture"];

        private _dialog = findDisplay 733835;
        private _iconCtrl = _dialog displayCtrl 1201;
        private _nameCtrl = _dialog displayCtrl 1200;

        _iconCtrl ctrlSetText _picture;
        _nameCtrl ctrlSetText _displayName;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
