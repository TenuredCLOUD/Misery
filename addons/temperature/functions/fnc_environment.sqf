#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Temperature Conversions & Wind Chill Algorithm
 * Implements WMO-standard wind chill formula (valid for ≤10°C & >4.8mph winds)
 * Accounts for apparent wind (meteorological + player movement vectors)
 * Automatic fallback to ambient temp outside valid ranges
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Windchill / Air temperature <NUMBER>
 *     1: SeaTemp <NUMBER>
 *     2: BreathFog <BOOL>
 *
 * Example:
 * [] call misery_temperature_fnc_environment;
 *
 * Public: No
*/

private _airTemp = 0;
private _seaTemp = nil;

if (isClass (missionConfigFile >> "CfgMisery_TemperatureData" >> "DailyTemps")) then {
    _airTemp = getArray (missionConfigFile >> "CfgMisery_TemperatureData" >> "DailyTemps" >> "airTemps");
    _airTemp = _airTemp select (date select 3);
} else {
    ambientTemperature params ["_airTemp", "_seaTemp"];
};

    private _altitude = (getPosASL player) select 2;

    _airTemp = [_airTemp - (_altitude / 1000) * 6.5, ace_weather_currentTemperature] select (!isNil "ace_weather_enabled" && {ace_weather_enabled}); // Temperature in Celsius at altitude or ace calculation

    private _windChillIndexCelsius = _airTemp;

    private _breathFog = false;

    if (!(isNull objectParent player) || insideBuilding player isEqualTo 1) then {
        _windChillIndexCelsius = _airTemp;
        _breathFog = false;
    } else {
        private _windSpeedMs = vectorMagnitude [wind select 0, wind select 1, 0];
        private _playerSpeedMs = abs(speed player) / 3.6; // Convert km/h to m/s
        private _apparentWindMs = _windSpeedMs + _playerSpeedMs;

        private _apparentWindMph = _apparentWindMs * 2.23694;

        if (_airTemp <= 10 && _apparentWindMph > 4.8) then {
            // North American/WMO wind chill formula
            _windChillIndexCelsius = 13.12 + (0.6215 * _airTemp) - (11.37 * (_apparentWindMph ^ 0.16)) + (0.3965 * _airTemp * (_apparentWindMph ^ 0.16));
        };

        if (_airTemp <= 7 && !(underwater player)) then {
            _breathFog = true;
        };
    };

    // Cap temperature between -50°C and 55°C
    _windChillIndexCelsius = (_windChillIndexCelsius max -50) min 55;

    // Automatically calculate seaTemp & cap at 1°C so water doesn't freeze
    if (isNil "_seaTemp" || {_seaTemp isEqualTo 0}) then {
        _seaTemp = linearConversion [-20, 40, _airTemp, 1, 25, true];
    };

    _seaTemp = _seaTemp max 1;

    [_windChillIndexCelsius, _seaTemp, _breathFog]
