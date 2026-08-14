#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Client handling of inside cognitohazard area.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cognito_hazard_fnc_process
*/

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    private _leftArea = GVAR(areasCached) findIf {ACE_player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        ACE_player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
        [{
            QGVAR(display) cutText ["", "PLAIN"];
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    private _totalProtection = [ACE_player] call EFUNC(protection,totalProtection);
    private _baseProtection = _totalProtection select 5;
    private _damageMultiplier = 0;
    private _psychModifier = 0;

    private _hasEHP = ACE_player getVariable [QCLASSACE(hasEHP), false];
    private _hasEarPlugs = ACE_player getVariable [QCLASSACE(hasEarPlugsIn), false];
    private _hasSHP = ACE_player getVariable [QGVAR(hasSHP), false];

    private _calculatedProtection = _baseProtection;

    if (_hasEHP) then {
        _calculatedProtection = _calculatedProtection + 0.35;
    };

    // Only give earplugs a bonus if hearing protection is worn over them
    if (_hasEarPlugs && {(_baseProtection > 0.3 || _hasEHP)}) then {
        _calculatedProtection = _calculatedProtection + 0.15;
    };

    _damageMultiplier = (1 * ((1 - (_calculatedProtection min 1)) ^ 1.5) min 0.15) max 0;
    _psychModifier = 1 * ((1 - (_calculatedProtection min 1)) ^ 1.5) max 0.001;

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Calculated Protection: %1%%", ((_calculatedProtection min 1) * 100)]] call EFUNC(common,debugMessage);

    switch (true) do {
        case (_hasSHP): {};
        case (_calculatedProtection >= 0.85): {
            if (EGVAR(psychosis,enabled)) then {
                [_psychModifier, "psychosis"] call EFUNC(common,addStatusModifier);
            };
        };
        case (_calculatedProtection >= 0.75): {
            QGVAR(display) cutRsc [QCLASS(tunnel_ui), "PLAIN", 1, false];
            if (EGVAR(psychosis,enabled)) then {
                [_psychModifier, "psychosis"] call EFUNC(common,addStatusModifier);
            };
        };
        default {
            QGVAR(display) cutRsc [QCLASS(tunnel_ui), "PLAIN", 1, false];
            if (EGVAR(psychosis,enabled)) then {
                [_psychModifier, "psychosis"] call EFUNC(common,addStatusModifier);
                [ACE_player, "head", ["Contusion", 1, 2, 1]] call ACEFUNC(medical,addWound);
            } else {
                [ACE_player, "head", ["Contusion", 1, 2, 1]] call ACEFUNC(medical,addWound);
                [ACE_player] call EFUNC(medical,handleHeadTrauma);
            };
        };
    };
}, 1] call CBA_fnc_addPerFrameHandler;
