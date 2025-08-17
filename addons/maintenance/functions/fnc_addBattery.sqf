#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process adding batteries to vehicles if allowed
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_addBattery
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
private _batteryCount = _vehicle getVariable [QGVAR(batteryCount), 1];
private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];

private _missingBatteries = _batteryCount - _installedBatteries;

if (_missingBatteries <= 0) exitWith {
    private _batteriesFull = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "All batteries already installed..."];
    [QEGVAR(common,tileText), _batteriesFull] call CBA_fnc_localEvent;
};

private _playerBatteryCount = [_batteryType] call EFUNC(common,countItem);

if (_playerBatteryCount >= 1) then {
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);
    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
    [{
        params ["_vehicle", "_batteryType", "_installedBatteries", "_batteryCount"];
        [player, _batteryType] call CBA_fnc_removeItem;
        _installedBatteries = _installedBatteries + 1;
        _vehicle setVariable [QGVAR(installedBatteries), _installedBatteries, true];
        _vehicle setVariable [QGVAR(batteryLevel), (_vehicle getVariable [QGVAR(batteryLevel), 0]) + (100 / _batteryCount), true];
        _vehicle setFuel (_vehicle getVariable [QGVAR(originalFuel), 1]);
        private _batteryInstallSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Installed (x1) %1. Total batteries: %2/%3. Battery level: %4%%.", [_batteryType] call EFUNC(common,getItemData) select 0, _installedBatteries, _batteryCount, _vehicle getVariable [QGVAR(batteryLevel), 0]]];
        [QEGVAR(common,tileText), _batteryInstallSuccess] call CBA_fnc_localEvent;
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
        [_vehicle] call FUNC(listed);
    }, [_vehicle, _batteryType, _installedBatteries, _batteryCount], 5] call CBA_fnc_waitAndExecute;
} else {
    private _needBattery = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Need (x1) %1 to install.", [_batteryType] call EFUNC(common,getItemData) select 0]];
    [QEGVAR(common,tileText), _needBattery] call CBA_fnc_localEvent;
};

