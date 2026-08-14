#include "script_component.hpp"

// Exit system if ACE repair is enabled
if (!isNil QACEGVAR(repair,enabled) && {ACEGVAR(repair,enabled)}) exitWith {};

if !(hasInterface) exitWith {};

if !(GVAR(difficulty)) then {

    ["CBA_loadingScreenDone", {

        addUserActionEventHandler ["headlights", "Activate", {
            params ["_activated"];

            if (!_activated) exitWith {};

            private _vehicle = objectParent ACE_player;

            if (isNull _vehicle || unitIsUAV _vehicle) exitWith {};

            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

            // Force lights off if battery is dead
            if (_batteryLevel <= 0) then {
                [{
                    params ["_vehicle"];
                    if (isLightOn _vehicle) then {
                        ACE_player action ["LightOff", _vehicle];
                    };
                }, [_vehicle], 0.02] call CBA_fnc_waitAndExecute;
            };
        }];

        // Dynamic Thermal / NVG equipment disabling
        ACE_player addEventHandler ["VisionModeChanged", {
            params ["_person", "_visionMode"];

            private _vehicle = objectParent _person;

            if (isNull _vehicle || unitIsUAV _vehicle) exitWith {};

            private _installedBatteries = _vehicle getVariable [QGVAR(installedBatteries), 0];
            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];

            private _found = false;
            private _batteryCount = 0;

            {
                if ((_x select 0) isEqualTo typeOf _vehicle) exitWith {
                    _found = true;
                    _batteryCount = _x select 6;
                };
            } forEach EGVAR(common,vehicleData);

            if (!_found) exitWith {};

            if (_batteryCount > 0 && _installedBatteries > 0 && _batteryLevel > 0) exitWith {
                equipmentDisabled _vehicle params ["_nvg", "_ti"];
                if (_nvg) then { _vehicle disableNVGEquipment false; };
                if (_ti) then { _vehicle disableTIEquipment false; };
            };

            if (_batteryCount > 0 && (_installedBatteries isEqualTo 0 || _batteryLevel <= 0) && _visionMode isNotEqualTo 0) then {
                _vehicle disableTIEquipment true;
                _vehicle disableNVGEquipment true;
            };
        }];

        ACE_player addEventHandler ["OpticsSwitch", {
            params ["_unit", "_isADS"];

            private _vehicle = objectParent _unit;

            if (isNull _vehicle || unitIsUAV _vehicle) exitWith {};

            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
            if (_batteryLevel > 0) exitWith {};

            if (_isADS && {gunner _vehicle isEqualTo _unit || commander _vehicle isEqualTo _unit}) then {
                _unit switchCamera "Internal";
            };
        }];

        ACE_player addEventHandler ["SeatSwitchedMan", {
            params ["_unit1", "_unit2", "_vehicle"];

            if (unitIsUAV _vehicle) exitWith {};

            if (_unit1 isEqualTo ACE_player || _unit2 isEqualTo ACE_player) then {
                ACE_player setVariable [QGVAR(isPilot), (ACE_player isEqualTo (currentPilot _vehicle))];
            };
        }];

        ACE_player addEventHandler ["GetInMan", {
            params ["_unit", "_role", "_vehicle"];

            if (_vehicle isKindOf "StaticWeapon" || unitIsUAV _vehicle) exitWith {};

            _unit setVariable [QGVAR(isPilot), (_unit isEqualTo (currentPilot _vehicle))];

            call FUNC(vehicleStats);
        }];

        ACE_player addEventHandler ["GetOutMan", {
            params ["_unit", "_role", "_vehicle"];

            if (_unit isNotEqualTo ACE_player || unitIsUAV _vehicle) exitWith {};

            if (_unit getVariable [QGVAR(isPilot), false] && {isLightOn _vehicle}) then {
                [{
                    params ["_vehicle", "_unit"];
                    _unit action ["LightOff", _vehicle];
                }, [_vehicle, _unit], 0.02] call CBA_fnc_waitAndExecute;
            };

            _unit setVariable [QGVAR(isPilot), nil];

            // Sync vehicle variables to server on exit
            private _batteryLevel = _vehicle getVariable [QGVAR(batteryLevel), 0];
            private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];
            private _currentCoolantLevel = _vehicle getVariable [QGVAR(coolantLevel), 0];

            _vehicle setVariable [QGVAR(batteryLevel), _batteryLevel, true];
            _vehicle setVariable [QGVAR(oilLevel), _currentOilLevel, true];
            _vehicle setVariable [QGVAR(coolantLevel), _currentCoolantLevel, true];
        }];

    }] call CBA_fnc_addEventHandler;
};
