#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process removal of batteries from vehicles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_removeBattery
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, format ["You need a toolkit to uninstall a battery..."]];
};

private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
private _batteryCount = _vehicle getVariable [QGVAR(batteryCount), 1];
private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

if (_installedBatteries <= 0) exitWith {
    ctrlSetText [1001, format ["%1 has no batteries left to remove...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
};

private _batteryType = _vehicle getVariable [QGVAR(batteryType), "misery_autoBattery"];

if (_installedBatteries > 0) then {
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);

    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
    [{
        params ["_vehicle", "_batteryType", "_installedBatteries", "_batteryCount", "_batteryLevel"];
        private _chargePerBattery = (((_batteryLevel * 100) / _installedBatteries) * _batteryCount);
        _installedBatteries = _installedBatteries - 1;
        _vehicle setVariable [QGVAR(installedBatteries), _installedBatteries, true];
        _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel - _chargePerBattery, true];
        if (_installedBatteries <= 0) then {
            _vehicle setVariable [QGVAR(batteryLevel), 0, true];
        };
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        [player, _batteryType, _chargePerBattery, true] call CBA_fnc_addMagazine;
        [_vehicle] call FUNC(listed);
    }, [_vehicle, _batteryType, _installedBatteries, _batteryCount, _batteryLevel], 3] call CBA_fnc_waitAndExecute;
};
