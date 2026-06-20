#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Server side device state grabber for AE3 battery states and fuel states
 * Creates a hashmap that is stored in a GRAD persistence trackable missionNamespace variable
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_grabDeviceStates;
 */

if (!isServer) exitWith {};

private _nestedDevices = [
    "Land_SolarPanel_04_olive_F_AE3",
    "Land_SolarPanel_04_black_F_AE3",
    "Land_SolarPanel_04_sand_F_AE3",
    "Land_Laptop_03_black_F_AE3",
    "Land_Laptop_03_olive_F_AE3",
    "Land_Laptop_03_sand_F_AE3"
];

private _directDevices = [
    "Land_BatteryPack_01_open_olive_F_AE3",
    "Land_BatteryPack_01_open_black_F_AE3",
    "Land_BatteryPack_01_open_sand_F_AE3"
];

private _fueledDevices = [
    "Land_PortableGenerator_01_F_AE3",
    "Land_PortableGenerator_01_black_F_AE3",
    "Land_PortableGenerator_01_sand_F_AE3",
    "Land_Portable_generator_F_AE3",
    "Land_MobileRadar_01_generator_F_AE3",
    "Land_DieselGroundPowerUnit_01_F_AE3",
    "Land_PowerGenerator_F_AE3"
];

private _masterDeviceMap = createHashMap;

{
    {
        private _device = _x;
        private _dummy = _device getVariable [QAE3GVAR(power,internal), objNull];

        if (!isNull _dummy) then {
            private _powerSource = _dummy getVariable [QAE3GVAR(power,batteryLevel), 0.1];

            private _key = _device call BIS_fnc_objectVar;

            _masterDeviceMap set [_key, [typeOf _device, _powerSource, 0, getPosASL _device, [vectorDir _device, vectorUp _device]]];
        };
    } forEach (allMissionObjects _x);
} forEach _nestedDevices;

{
    {
        private _device = _x;
        private _powerSource = _device getVariable [QAE3GVAR(power,batteryLevel), 1];
        private _key = _device call BIS_fnc_objectVar;

        _masterDeviceMap set [_key, [typeOf _device, _powerSource, 1, getPosASL _device, [vectorDir _device, vectorUp _device]]];
    } forEach (allMissionObjects _x);
} forEach _directDevices;

{
    {
        private _device = _x;
        private _key = _device call BIS_fnc_objectVar;

        _masterDeviceMap set [_key, [typeOf _device, fuel _device, 2, getPosASL _device, [vectorDir _device, vectorUp _device]]];
    } forEach (allMissionObjects _x);
} forEach _fueledDevices;

missionNamespace setVariable [QGVAR(deviceStates), _masterDeviceMap, true];
