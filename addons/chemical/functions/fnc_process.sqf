#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside chemical area.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_process
*/
[{
    params ["_args", "_handle"];

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

    #define BASE_EXPOSURE 10

    // Values can never be below zero.
    private _skinDeficit = (BASE_EXPOSURE * ((1 - _skinProtection) / 1)) max 0;
    private _respiratoryDeficit = BASE_EXPOSURE * ((1 - _respiratoryProtection) / 1) max 0;
    private _eyeDeficit = BASE_EXPOSURE * ((1 - _eyeProtection) / 1) max 0;
    private _effectiveExposure = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

    //Only damage player if exposure is greater than 0 - with enough protection values can turn negative, also reduce damage recieved to player
    if (_effectiveExposure > 0) then {
    _effectiveExposure = _effectiveExposure / 30;
    };

    // TODO: Compat ACE
    if (EGVAR(common,ace)) then {
        [player, _effectiveExposure, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
    } else {
        private _damage = damage player;
        player setDamage (_damage + _effectiveExposure);
    };

    private _msg = format ["Chemical Area Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"];
    [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
}, 1] call CBA_fnc_addPerFrameHandler;
