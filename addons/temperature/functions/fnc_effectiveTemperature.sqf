#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Temperature checks
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_effectiveTemperature;
 *
 * Public: No
*/

player setVariable [QGVAR(temperature), (call FUNC(environment)) select 0]; //Air temp
GVAR(seaTemperature) = (call FUNC(environment)) select 1; //Sea temp
private _clothesWarmth= (player call FUNC(clothing)) select 0;

//Parse values from temperature calculations
private _playerTemperature = player getVariable QGVAR(temperature);
player setVariable [QGVAR(temperature), (_playerTemperature + parseNumber ((_clothesWarmth)toFixed 2))];

private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];

private _ailments = player getVariable [QEGVAR(vitals,ailments), []];

//---------------------------
//Nearby fire check

if ([player] call EFUNC(common,nearFire)) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" isNotEqualTo -1 || _ailments find "INFECTION" isNotEqualTo -1))) then {

       if (abs(_exposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };

        _nearFireCalculation = MACRO_TEMPERATURE_FIREORVEHICLE(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_nearFireCalculation)toFixed 2))];

        if (_exposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];};

    } else {

        _sickNearFireCalculation = MACRO_TEMPERATURE_FIREORVEHICLE_SICK(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_sickNearFireCalculation)toFixed 2))];
    };
};

//---------------------------
//Inside house check (checks if player is "boxed in" and under roof)

if (insideBuilding player isEqualTo 1) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" isNotEqualTo -1 || _ailments find "INFECTION" isNotEqualTo -1))) then {

        if (abs(_exposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };

        _insideWarmCalculation = MACRO_TEMPERATURE_INSIDEBUILDING(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_insideWarmCalculation)toFixed 2))];

        if (_exposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {

        _sickInsideWarmCalculation = MACRO_TEMPERATURE_INSIDEBUILDING_SICK(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_sickInsideWarmCalculation)toFixed 2))];
    };
};

//---------------------------
//In a vehicle Check

if !(isNull objectParent player) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" isNotEqualTo -1 || _ailments find "INFECTION" isNotEqualTo -1))) then {

        if (abs(_exposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };

        _insideVehicleCalculation = MACRO_TEMPERATURE_FIREORVEHICLE(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_insideVehicleCalculation)toFixed 2))];

        if (_exposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {

        _sickInsideVehicleCalculation = MACRO_TEMPERATURE_FIREORVEHICLE_SICK(_playerTemperature);

        player setVariable [QEGVAR(survival,exposure), (_exposure + parseNumber ((_sickInsideVehicleCalculation)toFixed 2))];
    };
};

_playerTemperature
