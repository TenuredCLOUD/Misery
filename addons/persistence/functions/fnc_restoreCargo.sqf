#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * ACE Cargo API restore handle
 * Also restores AE3 items states stored in Cargo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_restoreCargo
*/

if (!isServer) exitWith {};

private _masterCargoMap = missionNamespace getVariable [QGVAR(cargoStates), createHashMap];

if (count _masterCargoMap isEqualTo 0) exitWith {};

{
    _y params ["_vehicleClass", "_savedPosASL", "_savedCargoArray"];

    private _nearVehicles = nearestObjects [ASLToAGL _savedPosASL, [_vehicleClass], 8];
    if (_nearVehicles isEqualTo []) then { continue };

    private _vehicle = _nearVehicles select 0;

    if (!isNull _vehicle) then {
        {
            _x params ["_className", "_powerData"];
            _powerData params ["_powerValue", "_powerType", "_damageValue"];

            private _spawnPos = (getPosWorld _vehicle) vectorAdd [0, 0, -100];

            private _cargoObject = createVehicle [_className, _spawnPos, [], 0, "CAN_COLLIDE"];

            if (_damageValue > 0) then {
                _cargoObject setDamage _damageValue;
            };

            switch (_powerType) do {
                case 0: {
                    if (_powerValue isNotEqualTo -1) then {
                        [{private _dummy = _this select 0 getVariable [QAE3GVAR(power,internal), objNull]; (!isNull _dummy) && {alive _dummy}},
                        {
                            params ["_object", "_battery"];

                            private _dummy = _object getVariable [QAE3GVAR(power,internal), objNull];
                            if (!isNull _dummy) then {
                                _dummy setVariable [QAE3GVAR(power,batteryLevel), _battery, true];
                            };
                        }, [_cargoObject, _powerValue], 0.5] call CBA_fnc_waitUntilAndExecute;
                    };
                };
                case 1: {
                    [{
                        params ["_object", "_battery"];
                        _object setVariable [QAE3GVAR(power,batteryLevel), _battery, true];
                    }, [_cargoObject, _powerValue], 0.2] call CBA_fnc_waitAndExecute;
                };
                case 2: {
                    [{
                        params ["_object", "_fuelVal"];
                        _object setFuel _fuelVal;
                    }, [_cargoObject, _powerValue], 0.2] call CBA_fnc_waitAndExecute;
                };
            };

            [{
                params ["_object", "_vehicle"];

                if (!isNull _object && !isNull _vehicle) then {
                    [_object, _vehicle, true] call ACEFUNC(cargo,loadItem);
                };
            }, [_cargoObject, _vehicle], 0.25] call CBA_fnc_waitAndExecute;

        } forEach _savedCargoArray;
    };
} forEach _masterCargoMap;
