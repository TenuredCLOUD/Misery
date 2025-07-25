#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Start Menu Handler
 * Creates a dialog when player enters driver seat to manage engine start/stop
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player] call misery_maintenance_fnc_vehicleStartMenu;
 *
 * Public: No
*/

params ["_vehicle", "_unit"];

if !(isPlayer _unit) exitWith {};

private _dialogCreated = createDialog QCLASS(VehicleStartMenu);

if (!_dialogCreated) exitWith {};

// Initialize dialog controls
private _dialog = findDisplay 274840;
private _startButton = _dialog displayCtrl 1600;
private _stopButton = _dialog displayCtrl 1601;
private _statusButton = _dialog displayCtrl 1602;
private _exitButton = _dialog displayCtrl 1603;

// Update vehicle status display
private _statusText = _dialog displayCtrl 1000;
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
_statusText ctrlSetText format ["Vehicle: %1", _vehicleName];

// Check battery status
private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 100];
private _hasBattery = _vehicle getVariable [QGVAR(hasBattery), true];

if (!_hasBattery || _batteryLevel <= 0) then {
    _startButton ctrlEnable false;
    _statusText ctrlSetText format ["Vehicle: %1\nBattery: %2", _vehicleName, if (_hasBattery) then {format ["Dead (%1%)", _batteryLevel]} else {"Missing"}];
} else {
    _startButton ctrlEnable true;
};

// Button actions
_startButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _dialog = ctrlParent _control;
    private _vehicle = _dialog getVariable [QGVAR(targetVehicle), objNull];
    if (isNull _vehicle) exitWith {closeDialog 0;};
    private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 100];
    if (_batteryLevel > 0) then {
        _vehicle engineOn true;
        [_vehicle, "batteryLevel", _batteryLevel - 10] call EFUNC(common,setVariable); // Drain battery on start
    };
    closeDialog 0;
}];

_stopButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _dialog = ctrlParent _control;
    private _vehicle = _dialog getVariable [QGVAR(targetVehicle), objNull];
    if (isNull _vehicle) exitWith {closeDialog 0;};
    _vehicle engineOn false;
    closeDialog 0;
}];

_statusButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _dialog = ctrlParent _control;
    private _vehicle = _dialog getVariable [QGVAR(targetVehicle), objNull];
    if (isNull _vehicle) exitWith {closeDialog 0;};
    [_vehicle] call FUNC(listed);
    closeDialog 0;
}];

_exitButton ctrlAddEventHandler ["ButtonClick", {
    closeDialog 0;
}];

_dialog setVariable [QGVAR(targetVehicle), _vehicle];
