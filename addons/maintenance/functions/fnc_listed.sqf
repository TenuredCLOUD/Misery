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

params ["_vehicle"];

[{!isNull findDisplay 274839},{
    params ["_vehicle"];

    private _list = findDisplay 274839 displayCtrl 1500;

    [{
        params ["_args", "_handle"];
        _args params ["_vehicle", "_list"];

        private _hasCrew = crew (_vehicle) isNotEqualTo [];

        if (_hasCrew) exitWith {
            [QEGVAR(common,tileText), format [localize LSTRING(CrewPresent), [_vehicle] call EFUNC(common,getObjectData) select 0]] call CBA_fnc_localEvent;
            _handle call CBA_fnc_removePerFrameHandler;
            (findDisplay 274839) closeDisplay 2;
        };

        if (isNull findDisplay 274839 || !alive ACE_player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (isNil "_vehicle") exitWith {
            [274839, [1600, 1602], false] call EFUNC(common,displayShowControls);
            ctrlSetText [1000, localize LSTRING(NoVehicleToRepair)];
        };

        ctrlSetText [1000, format [localize LSTRING(VehicleLabel), [_vehicle] call EFUNC(common,getObjectData) select 0]];

        lbClear _list;

        private _hitpoints = getAllHitPointsDamage _vehicle;
        private _hitpointNames = _hitpoints select 0;
        private _selectionNames = _hitpoints select 1;
        private _damages = _hitpoints select 2;

        private _unlistedHiddenPoints = [];

        {
            private _hitpointName = _hitpointNames select _forEachIndex;
            private _selectionName = _selectionNames select _forEachIndex;
            private _damage = _damages select _forEachIndex;

            if (_damage > 0) then {
                // If valid visual selection name, display individually
                if (_selectionName isNotEqualTo "") then {
                    private _damagePercent = _damage * 100;
                    private _index = _list lbAdd format [localize LSTRING(VehicleDamageStatus), _selectionName, [_damagePercent, 1, 1, false] call CBA_fnc_formatNumber];
                    _list lbSetData [_index, str _forEachIndex];
                } else {
                    // Collect unnamed or internal hitpoint indexes that are hidden
                    _unlistedHiddenPoints pushBack _forEachIndex;
                };
            };
        } forEach _hitpointNames;

        // Only show "Quick Service" if there are actual unlisted hidden hitpoints with damage
        if (_unlistedHiddenPoints isNotEqualTo []) then {
            private _quickServiceIndex = _list lbAdd localize LSTRING(QuickService);

            _list lbSetData [_quickServiceIndex, str _unlistedHiddenPoints];
        };

    }, 0.5, [_vehicle, _list]] call CBA_fnc_addPerFrameHandler;
},[_vehicle]] call CBA_fnc_waitUntilAndExecute;
