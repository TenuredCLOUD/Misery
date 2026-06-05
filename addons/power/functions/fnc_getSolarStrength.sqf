#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Calculates solar strength based on sun elevation, overcast, rain, and fog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Solar strength <NUMBER>
 *
 * Example:
 * [] call misery_power_fnc_calculateSolarStrength
 *
*/

call FUNC(getSunPosition) params ["_sunAzimuth", "_sunElevation"];

if (_sunElevation <= 0) exitWith {0};

private _baseStrength = linearConversion [0, 70, _sunElevation, 0, 1, true];

private _overcastPenalty = linearConversion [0, 1, overcast, 1, 0.35, true];

private _fogPenalty = linearConversion [0, 1, fog, 1, 0.2, true];

private _rainPenalty = linearConversion [0, 1, rain, 1, 0.5, true];

private _finalSunStrength = _baseStrength * _overcastPenalty * _fogPenalty * _rainPenalty;

_finalSunStrength
