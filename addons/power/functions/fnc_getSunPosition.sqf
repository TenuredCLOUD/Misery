#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Calculates approximate seasonal solar azimuth and elevation based on date & time
 * Formula provides an estimation rather than exact position
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Sun Azimuth <NUMBER>
 *     1: Sun Elevation <NUMBER>
 *
 * Example:
 * [] call misery_power_fnc_getSunPosition
 *
*/

date params ["_year", "_month", "_day"];

private _azimuth = (dayTime * 15) % 360;

private _monthDistance = abs (6 - _month);

private _seasonalMaxPeak = linearConversion [0, 6, _monthDistance, 75, 35, true];

private _degPhase = (dayTime - 6) * 15;
private _elevation = 0;

if (dayTime >= 6 && dayTime <= 18) then {
    private _sineWave = sin _degPhase;

    _elevation = _sineWave * _seasonalMaxPeak;
};

[_azimuth, _elevation]
