#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Environment exposure utilizing ACE weather API
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Air temperature <NUMBER>
 *     1: HeatIndex <NUMBER>
 *     2: Windchill <NUMBER>
 *     3: Humidity <NUMBER>
 *     4: BreathFog <BOOL>
 *
 * Example:
 * [] call misery_temperature_fnc_environment;
 *
 * Public: No
*/

private _posASL = getPosASL ACE_player;
private _altitude = _posASL select 2;

private _temperature = _altitude call ACEFUNC(weather,calculateTemperatureAtHeight);

private _windSpeed = [[_posASL, false, true, true] call ACEFUNC(weather,calculateWindSpeed), [_posASL, true, true, true] call ACEFUNC(weather,calculateWindSpeed)] select (ACEGVAR(advanced_ballistics,enabled));

private _heatIndex = [_temperature, ACEGVAR(weather,currentHumidity)] call ACEFUNC(weather,calculateHeatIndex);
private _windChill = [_temperature, _windSpeed] call ACEFUNC(weather,calculateWindChill);
private _dewPoint = [_temperature, ACEGVAR(weather,currentHumidity)] call ACEFUNC(weather,calculateDewPoint);

private _breathFog = false;
if (isNull objectParent ACE_player && {insideBuilding ACE_player isEqualTo 0}) then {
    if ((_temperature <= _dewPoint + 1 || _temperature <= 2) && {!(underwater ACE_player)}) then {
        _breathFog = true;
    };
};

[_temperature, _heatIndex, _windChill, ACEGVAR(weather,currentHumidity), _breathFog]
