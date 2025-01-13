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

private _totalProtection = call EFUNC(protection,totalProtection);

private _skinProtection = _totalProtection select 2;
private _respiratoryProtection = _totalProtection select 3;
private _eyeProtection = _totalProtection select 4;

private _baseExposure = 10;

private _skinDeficit = _baseExposure * ((1 - _skinProtection) / 1);
private _respiratoryDeficit = _baseExposure * ((1 - _respiratoryProtection) / 1);
private _eyeDeficit = _baseExposure * ((1 - _eyeProtection) / 1);

//Make sure values don't go below 0 - if protection is higher than 1 this can happen: 
if (_skinDeficit < 0) then {_skinDeficit = 0};
if (_respiratoryDeficit < 0) then {_respiratoryDeficit = 0};
if (_eyeDeficit < 0) then {_eyeDeficit = 0};

private _effectiveExposure = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

//Only damage player if exposure is greater than 0 - with enough protection values can turn negative, also reduce damage recieved to player
if (_effectiveExposure > 0) then {
   _effectiveExposure = _effectiveExposure / 30;
};

if (EGVAR(common,ace)) then {
    [player, _effectiveExposure, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
    } else {
    private _damage = damage player;
    player setDamage (_damage + _effectiveExposure);
};

if (EGVAR(common,debug)) then {
    systemChat format ["Chemical Area Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"];
};

    private _leftArea = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
