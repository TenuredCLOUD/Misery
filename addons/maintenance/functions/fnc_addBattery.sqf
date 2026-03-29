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

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, format ["You need a toolkit to install a battery..."]];
};

private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
private _batteryCount = _vehicle getVariable [QGVAR(batteryCount), 1];
private _batteryType = _vehicle getVariable [QGVAR(batteryType), 0];
private _batteryClass = [QCLASS(autoBattery), QCLASS(autoBattery_Heavy)] select (_batteryType isEqualTo 1);

private _missingBatteries = _batteryCount - _installedBatteries;

if (_missingBatteries <= 0) exitWith {
    ctrlSetText [1001, format ["All batteries already installed..."]];
};

private _playerBatteryCount = [_batteryClass] call EFUNC(common,countItem);

if (_playerBatteryCount >= 1) then {
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
    [{
        params ["_vehicle", "_batteryType", "_batteryClass", "_installedBatteries", "_batteryCount"];
        [_batteryClass] call EFUNC(common,countMagazinesAmmo) params ["_batteryLife"];
        [player, _batteryClass] call CBA_fnc_removeMagazine;
        _installedBatteries = _installedBatteries + 1;
        _vehicle setVariable [QGVAR(installedBatteries), _installedBatteries, true];
        _vehicle setVariable [QGVAR(batteryLevel), (_vehicle getVariable [QGVAR(batteryLevel), 0]) + ((_batteryLife / 100) / _batteryCount), true];
        ctrlSetText [1001, format ["Installed (x1) %1. Total batteries: %2/%3.", [_batteryClass] call EFUNC(common,getItemData) select 0, _installedBatteries, _batteryCount]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        [_vehicle] call FUNC(listed);
    }, [_vehicle, _batteryType, _batteryClass, _installedBatteries, _batteryCount], 3] call CBA_fnc_waitAndExecute;
} else {
    ctrlSetText [1001, format ["Need (x1) %1 to install.", [_batteryType] call EFUNC(common,getItemData) select 0]];
};

