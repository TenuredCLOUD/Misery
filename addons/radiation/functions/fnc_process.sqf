#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside radiation zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_process
*/

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

    // Non-linear deficits for better scaling, even with protection of 3 very small radiation leaks occur
    private _skinDeficit = (1 * ((1 - _skinProtection) ^ 1.5)) max 0.001;
    private _respiratoryDeficit = (1 * ((1 - _respiratoryProtection) ^ 1.5)) max 0.001;
    private _eyeDeficit = (1 * ((1 - _eyeProtection) ^ 1.5)) max 0.001;
    private _baseEffectiveDose = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

    private _zoneDose = 0;
    private _rainDose = 0;

    private _activeAreaIndex = GVAR(areas) findIf {player inArea _x};
    private _insideRadZone = _activeAreaIndex isNotEqualTo -1;

    if (_insideRadZone) then {
        private _marker = GVAR(areas) select _activeAreaIndex;
        private _markerSize = getMarkerSize _marker;
        private _maxRadius = (_markerSize select 0) max (_markerSize select 1);
        private _distToCenter = player distance (getMarkerPos _marker);

        private _zoneIntensity = linearConversion [_maxRadius, 0, _distToCenter, 0.1, 1, true];

        _zoneDose = linearConversion [0, 1, _zoneIntensity * _baseEffectiveDose, 0, 0.00044, true];
    };

    if (GVAR(radioactiveRain) && {rain > 0.1}) then {
        private _isExposed = (isNull objectParent player) && (insideBuilding player isNotEqualTo 1);

        if !(isNull objectParent player) then {
            _isExposed = getNumber (configOf (vehicle player) >> "transportSoldier") < 2;
        };

        if (_isExposed) then {
            _rainDose = linearConversion [0.1, 1, rain * _baseEffectiveDose, 0, 0.00022, true];
        };
    };

    private _totalDose = _zoneDose + _rainDose;

    if (_totalDose > 0) then {
        [_totalDose, "radiation"] call EFUNC(common,addStatusModifier);
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Total Effective Dose: %1 (Zone: %2, Rain: %3)", _totalDose, _zoneDose, _rainDose]] call EFUNC(common,debugMessage);

    private _isSafeFromRain = (rain < 0.1) || (_rainDose isEqualTo 0 && !_insideRadZone);

    if (!_insideRadZone && _isSafeFromRain) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
