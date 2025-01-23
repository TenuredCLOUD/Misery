#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Warmup
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_warmup;
 *
 * Public: No
*/

private _playerTemperature = player getVariable [QGVAR(thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
private _exposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];

if ([player] call EFUNC(common,nearFire) || insideBuilding player isEqualTo 1 || !(isNull objectParent player)) exitWith {};

if (_playerTemperature >= 20 && _playerTemperature < 33) then {
    if (!(_parasites > 0 || _infection > 0)) then {
        if (_exposure < 0) then {
            private _temperatureWarmUp = (_playerTemperature / 10) / 10;
            [+_temperatureWarmUp, "exposure"] call EFUNC(common,addModifier);

            if (_exposure >= 0) then {
            player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];};
            };

            if (_exposure > 0) then {
            private _temperatureCoolDown = (_playerTemperature / 10) / 10;
            [-_temperatureCoolDown, "exposure"] call EFUNC(common,addModifier);

            if (_exposure <= 0) then {
            player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
            };
        };
    };
};
