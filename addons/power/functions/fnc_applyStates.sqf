#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Re-apply AE3 device states from stored missionNamespace hashmap
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_applyStates;
 */

if (!isServer) exitWith {};

private _masterDeviceMap = missionNamespace getVariable [QGVAR(deviceStates), createHashMap];
if (count _masterDeviceMap isEqualTo 0) exitWith {};

{
    _x params ["_className", "_powerSource", "_powerType", "_savedPosASL", "_savedVector"];

    private _device = createVehicle [_className, _savedPosASL, [], 0, "CAN_COLLIDE"];
    _device setPosASL _savedPosASL;
    _device setVectorDirAndUp _savedVector;

    switch (_powerType) do {
        case 0: {
            [
                {
                    private _dummy = _this select 0 getVariable [QAE3GVAR(power,internal), objNull];
                    (!isNull _dummy) && {alive _dummy}
                },
                {
                    params ["_device", "_powerSource"];
                    [{
                        params ["_device", "_powerSource"];
                        private _dummy = _device getVariable QAE3GVAR(power,internal);
                        if (!isNull _dummy) then {
                            _dummy setVariable [QAE3GVAR(power,batteryLevel), _powerSource, true];
                        };
                    }, [_device, _powerSource], 0.1] call CBA_fnc_waitAndExecute;
                },
                [_device, _powerSource],
                0.2
            ] call CBA_fnc_waitUntilAndExecute;
        };
        case 1: {
            [{
                params ["_device", "_powerSource"];
                _device setVariable [QAE3GVAR(power,batteryLevel), _powerSource, true];
            }, [_device, _powerSource], 0.2] call CBA_fnc_waitAndExecute;
        };
        case 2: {
            [{
                params ["_device", "_powerSource"];
                _device setFuel _powerSource;
            }, [_device, _powerSource], 0.2] call CBA_fnc_waitAndExecute;
        };
    };
} forEach (values _masterDeviceMap);
