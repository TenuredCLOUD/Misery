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

// PFH monitoring when the player leaves the radzone.
[{
    params ["_args", "_handle"];

//Handle dosage
call EFUNC(protection,totalProtection) params ["", "", "_skinProtection", "_respiratoryProtection", "_eyeProtection"];

private _skinDeficit = MACRO_BASE_DOSE * ((1 - _skinProtection) / 1);
private _respiratoryDeficit = MACRO_BASE_DOSE * ((1 - _respiratoryProtection) / 1);
private _eyeDeficit = MACRO_BASE_DOSE * ((1 - _eyeProtection) / 1);

private _effectiveDose = (_skinDeficit + _respiratoryDeficit + _eyeDeficit) max 0; // with enough protection values can turn negative

[_effectiveDose, "radiation"] call EFUNC(common,addModifier);

[QUOTE(COMPONENT_BEAUTIFIED), format ["Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"]] call EFUNC(common,debugMessage);
[QUOTE(COMPONENT_BEAUTIFIED), format ["Effective Radiation Dose: %1", _effectiveDose]] call EFUNC(common,debugMessage);

    private _leftRadZone = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftRadZone) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
