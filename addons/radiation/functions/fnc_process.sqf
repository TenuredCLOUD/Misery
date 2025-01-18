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
private _totalProtection = call EFUNC(protection,totalProtection);

private _skinProtection = _totalProtection select 2;
private _respiratoryProtection = _totalProtection select 3;
private _eyeProtection = _totalProtection select 4;

private _baseDose = 10;
private _skinDeficit = _baseDose * ((1 - _skinProtection) / 1);
private _respiratoryDeficit = _baseDose * ((1 - _respiratoryProtection) / 1);
private _eyeDeficit = _baseDose * ((1 - _eyeProtection) / 1);

//Make sure values don't go below 0 - if protection is higher than 1 this can happen:
if (_skinDeficit < 0) then {_skinDeficit = 0};
if (_respiratoryDeficit < 0) then {_respiratoryDeficit = 0};
if (_eyeDeficit < 0) then {_eyeDeficit = 0};

private _effectiveDose = _skinDeficit + _respiratoryDeficit + _eyeDeficit;

//Only dose player if effective dose is greater than 0 - with enough protection values can turn negative
if (_effectiveDose > 0) then {
player setVariable [QCLASS(radiation), (player getVariable [QCLASS(radiation), 0]) + _effectiveDose];
};

if (EGVAR(common,debug)) then {
    systemChat format ["Radiation Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"];
    systemChat format ["Effective Radiation Dose: %1", _effectiveDose];
};

    private _leftRadZone = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftRadZone) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
