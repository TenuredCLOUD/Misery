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

    [player] call FUNC(nearVehicle) params ["_nearVehicle", "_vehicle"];

    private _list = findDisplay 274839 displayCtrl 1500;
    private _repairButton = findDisplay 274839 displayCtrl 1600;
    private _refuelButton = findDisplay 274839 displayCtrl 1601;
    private _scavengeButton = findDisplay 274839 displayCtrl 1602;
    private _statusText = findDisplay 274839 displayCtrl 1000;

    _repairButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _dialog = ctrlParent _control;
        private _list = _dialog displayCtrl 1500;
        private _selected = lbCurSel _list;
        if (_selected isEqualTo -1) exitWith {systemChat "No Repair option selected...";};
        private _hitpoint = _list lbData _selected;
        [_vehicle, _hitpoint] call FUNC(repair);
    }];

    _refuelButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _dialog = ctrlParent _control;
        private _list = _dialog displayCtrl 1500;
        private _selected = lbCurSel _list;
        if (_selected isEqualTo -1) exitWith {systemChat "No Repair option selected...";};
        private _hitpoint = _list lbData _selected;
        [_vehicle, _hitpoint] call FUNC(refuel);
    }];

    _scavengeButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _dialog = ctrlParent _control;
        private _list = _dialog displayCtrl 1500;
        private _selected = lbCurSel _list;
        if (_selected isEqualTo -1) exitWith {systemChat "No Scavenge option selected...";};
        private _hitpoint = _list lbData _selected;
        [_vehicle, _hitpoint] call FUNC(scavenge);
    }];

    [{
        params ["_args", "_handle"];
        _args params ["_nearVehicle", "_vehicle", "_list", "_repairButton", "_refuelButton", "_scavengeButton", "_statusText"];

        if (isNull findDisplay 274839 || !alive player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (isNil "_vehicle") exitWith {
            _repairButton ctrlShow false;
            _scavengeButton ctrlShow false;
            _statusText ctrlSetText "No Vehicle to Repair...";
        };

        private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
        _statusText ctrlSetText format ["Vehicle: %1", _vehicleName];

        lbClear _list;

        // Add hitpoints
        private _hitpoints = getAllHitPointsDamage _vehicle;
        private _hitpointNames = _hitpoints select 0;
        private _damages = _hitpoints select 2;

        {
            private _hitpointName = _hitpointNames select _forEachIndex;
            private _damage = _damages select _forEachIndex;
            private _damagePercent = _damage * 100;
            private _index = _list lbAdd format ["%1 - Damage: %2%%", _hitpointName, [_damagePercent, 1, 1, false] call CBA_fnc_formatNumber];
            _list lbSetData [_index, _hitpointName];
        } forEach _hitpointNames;

        // Add battery entry
        private _requiredBatteries = _vehicle getVariable [QGVAR(batteryCount), 1];
        private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];
        private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 100];
        private _cargo = getItemCargo _vehicle;
        private _items = _cargo select 0;
        private _counts = _cargo select 1;
        private _installedBatteries = 0;
        private _index = _items find _batteryType;
        if (_index != -1) then {
            _installedBatteries = _counts select _index;
        };
        private _batteryStatus = format ["Battery - %1/%2 (%3%% charge)", _installedBatteries, _requiredBatteries, _batteryLevel];
        private _batteryIndex = _list lbAdd _batteryStatus;
        _list lbSetData [_batteryIndex, "Battery"];

    }, 0.5, [_nearVehicle, _vehicle, _list, _repairButton, _refuelButton, _scavengeButton, _statusText]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
