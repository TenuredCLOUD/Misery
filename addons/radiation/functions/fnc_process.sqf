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
    private _skinDeficit = (MACRO_BASE_DOSE * ((1 - _skinProtection) ^ 1.5)) max 0.001;
    private _respiratoryDeficit = (MACRO_BASE_DOSE * ((1 - _respiratoryProtection) ^ 1.5)) max 0.001;
    private _eyeDeficit = (MACRO_BASE_DOSE * ((1 - _eyeProtection) ^ 1.5)) max 0.001;
    private _effectiveDose = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

    if (_effectiveDose > 0) then {
        _effectiveDose = _effectiveDose / 300;
        [_effectiveDose, "radiation"] call EFUNC(common,addStatusModifier);
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Radiation Dose: %1", _effectiveDose]] call EFUNC(common,debugMessage);

    private _leftRadZone = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftRadZone) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 15] call CBA_fnc_addPerFrameHandler;
