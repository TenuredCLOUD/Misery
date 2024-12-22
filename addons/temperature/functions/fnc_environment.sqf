#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Temperature Conversions & Wind Chill Algorithm
 * Returns calculated windchill as well as world temperatures (Runs on a per client basis, but base data is synced to all clients)
 * Calculates Wind chill player is simulated to be experiencing (simplified algorithm)
 * Calculates air temperature with elevational differences (simplified algorithm)
 * Utilizes Overcast and Rain values as proxies to simulate humidity (simplified algorithm)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_environment;
 *
 * Public: No
*/

private _airTemp = ambientTemperature select 0;
private _seaTemp = ambientTemperature select 1;
private _overcast = overcast;
private _rain = rain;

private _altitude = (getPosASL player) select 2;

_airTemp = (_airTemp - (_altitude / 1000) * 6.5) * 9/5 + 32;

private _windChillIndexCelsius = 0;
private _humidity = (_overcast + _rain) / 2;

private _breathFog = parseNumber ((_airTemp <= 45) && (_humidity >= 0.6));

if (_seaTemp <= 0) then {
    _seaTemp = 0;
};

if (!(isNull objectParent player) || ((insideBuilding player == 1))) then {
    _windChillIndex = _airTemp;
    _windChillIndexCelsius = (_windChillIndex - 32) * 5/9;
    _breathFog = 0;
}else{
    _windSpeed = (wind select 0) * 2.23694;

    if (isNull objectParent player) then {
        _playerSpeed = (speed player) * 0.277778;
        _windSpeed = _windSpeed + _playerSpeed;
    };

if (_windSpeed < 0.01) then {
    _windSpeed = 0;
};

if (_airTemp <= 50 && _windSpeed >= 3) then {
    if (_windSpeed <= 0) then {
        _windChillIndex = _airTemp;
        _windChillIndexCelsius = _airTemp;
    } else {
        _windChillIndex = 35.74 + 0.6215 * _airTemp - 35.75 * (_windSpeed^0.16) + 0.4275 * _airTemp * (_windSpeed^0.16);
        _windChillIndexCelsius = (_windChillIndex - 32) * 5/9;
    };
}else{
    _windChillIndex = _airTemp;
    _windChillIndexCelsius = (_windChillIndex - 32) * 5/9;
    };
};

[_windChillIndexCelsius, _seaTemp, _breathFog]