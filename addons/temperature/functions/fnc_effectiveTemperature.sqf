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

private _playerTemperature = player getVariable [QGVAR(temperature), (call FUNC(environment)) select 0];
GVAR(seaTemperature) = (call FUNC(environment)) select 1;
private _clothesWarmth = (player call FUNC(clothing)) select 0;
player setVariable [QGVAR(temperature), (_playerTemperature + parseNumber ((_clothesWarmth)toFixed 2))];
private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];

if ([player] call EFUNC(common,nearFire)) then {

    if ((_playerTemperature < 20) && !(_parasites > 0 || _infection > 0)) then {
       if (abs(_exposure) < 0.0001) exitWith {
        player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    };
        private _nearFireCalculation = (((20 - _playerTemperature) * 2) / 5) / 5;

        [+_nearFireCalculation, "exposure"] call EFUNC(common,addModifier);

        if (_exposure > 0) then {
            player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };
    } else {
        private _sickNearFireCalculation = ((_playerTemperature) / 100) / 100;
        [+_sickNearFireCalculation, "exposure"] call EFUNC(common,addModifier);
    };
};

if (insideBuilding player isEqualTo 1) then {

    if ((_playerTemperature < 20) && !(_parasites > 0 || _infection > 0)) then {

        if (abs(_exposure) < 0.0001) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };

        private _insideWarmCalculation = (((20 - _playerTemperature) * 2) / 10) / 10;
        [+_insideWarmCalculation, "exposure"] call EFUNC(common,addModifier);

        if (_exposure > 0) then {
            player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };
    } else {
        private _sickInsideWarmCalculation = ((_playerTemperature) / 12) / 120;
        [+_sickInsideWarmCalculation, "exposure"] call EFUNC(common,addModifier);
    };
};

if !(isNull objectParent player) then {

    if ((_playerTemperature < 20) && !(_parasites > 0 || _infection > 0)) then {

        if (abs(_exposure) < 0.0001) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };

        private _insideVehicleCalculation = (((20 - _playerTemperature) * 2) / 5) / 5;
        [+_insideVehicleCalculation, "exposure"] call EFUNC(common,addModifier);

        if (_exposure > 0) then {
            player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
        };
    } else {
        private _sickInsideVehicleCalculation = ((_playerTemperature) / 100) / 100;
        [+_sickInsideVehicleCalculation, "exposure"] call EFUNC(common,addModifier);
    };
};
