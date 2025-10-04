#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance UI List populater
 * Defines the needed repairs, or possible scavenging
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_listed;
 *
 * Public: No
*/

[{!isNull findDisplay 274839},{

    [player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

    private _list = findDisplay 274839 displayCtrl 1500;

    [{
        params ["_args", "_handle"];
        _args params ["_nearVehicle", "_vehicle", "_list", "_batteryStatusText"];

        [player] call EFUNC(common,nearVehicle) params ["", "", "_hasCrew"];

        if (_hasCrew) exitWith {
            [QEGVAR(common,tileText), format ["Crew is present in %1, preventing any maintenance...", [_vehicle] call EFUNC(common,getObjectData) select 0]] call CBA_fnc_localEvent;
            _handle call CBA_fnc_removePerFrameHandler;
            (findDisplay 274839) closeDisplay 2;
        };

        if (isNull findDisplay 274839 || !alive player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (isNil "_vehicle") exitWith {
            [274839, [1600, 1602], false] call EFUNC(common,displayShowControls);
            ctrlSetText [1000, "No Vehicle to Repair..."];
        };

        ctrlSetText [1000, format ["Vehicle: %1", [_vehicle] call EFUNC(common,getObjectData) select 0]];

        lbClear _list;

        // Add hitpoints
        private _hitpoints = getAllHitPointsDamage _vehicle;
        private _hitpointNames = _hitpoints select 0;
        private _selectionNames = _hitpoints select 1;
        private _damages = _hitpoints select 2;

        {
            private _selectionName = _selectionNames select _forEachIndex;
            if (_selectionName != "") then {
                private _damage = _damages select _forEachIndex;
                private _damagePercent = _damage * 100;
                private _index = _list lbAdd format ["%1 - Damage: %2%%", _selectionName, [_damagePercent, 1, 1, false] call CBA_fnc_formatNumber];
                _list lbSetData [_index, str _forEachIndex];
            };
        } forEach _selectionNames;

    }, 0.5, [_nearVehicle, _vehicle, _list, _batteryStatusText]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
