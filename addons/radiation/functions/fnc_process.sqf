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

private _protectionFactor = _skinProtection + _respiratoryProtection + _eyeProtection;

private _baseDose = 10;
private _effectiveDose = _baseDose * (1 - (_protectionFactor / 3));

//Only dose player if effective dose is greater than 0 - with enough protection values can turn negative 
if (_effectiveDose > 0) then {
player setVariable [QCLASS(radiation), (player getVariable [QCLASS(radiation), 0]) + _effectiveDose];
};

if (EGVAR(common,debug)) then {
    systemChat format ["Radiation Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", (_skinProtection * 100), "%", (_respiratoryProtection * 100), "%", (_eyeProtection * 100), "%"];
    systemChat format ["Effective Radiation Dose: %1", _effectiveDose];
};

    private _leftRadZone = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftRadZone) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
