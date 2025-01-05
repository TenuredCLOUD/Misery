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

private _protectionFactor = _skinProtection + _respiratoryProtection + _eyeProtection;

if (EGVAR(common,debug)) then {
    systemChat format ["Chemical Area Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", _skinProtection, "%", _respiratoryProtection, "%", _eyeProtection, "%"];
};

    private _leftArea = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
