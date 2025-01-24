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

private _airTemp = ambientTemperature select 0; // Get temperature in Celsius
private _seaTemp = ambientTemperature select 1; // Get black-hot surface temperatures
private _altitude = (getPosASL player) select 2;

_airTemp = _airTemp - (_altitude / 1000) * 6.5; // Temperature in Celsius at altitude

private _airTempF = _airTemp * 9/5 + 32;

private _windChillIndexCelsius = _airTemp; // Default to air temp
private _breathFog = false;

private _humidity = linearConversion [0, 1, (overcast + rain + fog)/3, 0.3, 1, true];

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

    if (_windChillIndexCelsius <= 7 && _humidity >= 0.6 && (rain < 0.5) && !(underwater player)) then {
        _breathFog = true;
    };
};

_seaTemp = _seaTemp max 0;

[_windChillIndexCelsius, _seaTemp, _breathFog]
