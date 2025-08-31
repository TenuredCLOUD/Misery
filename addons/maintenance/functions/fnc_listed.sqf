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
    private _addBatteryButton = findDisplay 274839 displayCtrl 1607;
    private _removeBatteryButton = findDisplay 274839 displayCtrl 1606;
    private _coolantButton = findDisplay 274839 displayCtrl 1605;
    private _removeCoolantButton = findDisplay 274839 displayCtrl 1610;
    private _oilButton = findDisplay 274839 displayCtrl 1604;
    private _removeOilButton = findDisplay 274839 displayCtrl 1609;
    private _repairButton = findDisplay 274839 displayCtrl 1600;
    private _refuelButton = findDisplay 274839 displayCtrl 1601;
    private _syphonButton = findDisplay 274839 displayCtrl 1608;
    private _scavengeButton = findDisplay 274839 displayCtrl 1602;
    private _statusText = findDisplay 274839 displayCtrl 1000;

    _addBatteryButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(addBattery);
    }];

    _removeBatteryButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(removeBattery);
    }];

    _coolantButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(addCoolant);
    }];

    _removeCoolantButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(removeCoolant);
    }];

    _oilButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(addOil);
    }];

    _removeOilButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(removeOil);
    }];

    _refuelButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(refuel);
    }];

    _syphonButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        call FUNC(syphon);
    }];

    _repairButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _dialog = ctrlParent _control;
        private _list = _dialog displayCtrl 1500;
        private _selected = lbCurSel _list;
        if (_selected isEqualTo -1) exitWith {systemChat "No Repair option selected...";};
        private _hitpoint = _list lbData _selected;
        [_hitpoint, _selected] call FUNC(repair);
    }];

    _scavengeButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _dialog = ctrlParent _control;
        private _list = _dialog displayCtrl 1500;
        private _selected = lbCurSel _list;
        if (_selected isEqualTo -1) exitWith {systemChat "No Scavenge option selected...";};
        private _hitpoint = _list lbData _selected;
        [_hitpoint, _selected] call FUNC(scavenge);
    }];

    [{
        params ["_args", "_handle"];
        _args params ["_nearVehicle", "_vehicle", "_list", "_repairButton", "_refuelButton", "_scavengeButton", "_statusText", "_batteryStatusText"];

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
            _repairButton ctrlShow false;
            _scavengeButton ctrlShow false;
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

    }, 0.5, [_nearVehicle, _vehicle, _list, _repairButton, _refuelButton, _scavengeButton, _statusText, _batteryStatusText]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
