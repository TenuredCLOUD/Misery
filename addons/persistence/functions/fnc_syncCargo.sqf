#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Map scanner for ACE cargo API persistence
 * Also handles AE3 items stored in Cargo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_syncCargo
*/

if (!isServer) exitWith {};

private _masterCargoMap = createHashMap;

private _allVehicles = allMissionObjects "AllVehicles" - allMissionObjects "Man" - allMissionObjects "StaticWeapon";

{
    private _vehicle = _x;

    private _rawCargo = _vehicle getVariable [QACEGVAR(cargo,loaded), []];

    if (_rawCargo isNotEqualTo []) then {
        private _serializedCargo = [];

        {
            if (_x isEqualType "") then {
                _serializedCargo pushBack [_x, [-1, -1, 0]];
            } else {
                if (!isNull _x) then {
                    private _classname = typeOf _x;
                    private _damageVal = damage _x;
                    private _powerData = [0, -1, _damageVal];

                    private _dummy = _x getVariable [QAE3GVAR(power,internal), objNull];

                    if (!isNull _dummy) then {
                        private _battery = _dummy getVariable [QAE3GVAR(power,batteryLevel), 0.1];

                        _powerData = [_battery, 0, _damageVal];

                    } else {
                        private _directBattery = _x getVariable [QAE3GVAR(power,batteryLevel), -1];

                        if (_directBattery isNotEqualTo -1) then {

                            _powerData = [_directBattery, 1, _damageVal];
                        } else {


                            if (_classname in EGVAR(power,generators)) then {

                                _powerData = [fuel _x, 2, _damageVal];
                            };
                        };
                    };

                    _serializedCargo pushBack [_classname, _powerData];
                };
            };
        } forEach _rawCargo;

        if (_serializedCargo isNotEqualTo []) then {

            private _vehicleKey = format ["%1_%2", typeOf _vehicle, getPosASL _vehicle];

            _masterCargoMap set [_vehicleKey, [typeOf _vehicle, getPosASL _vehicle, _serializedCargo]];
        };
    };
} forEach _allVehicles;

missionNamespace setVariable [QGVAR(cargoStates), _masterCargoMap, true];
