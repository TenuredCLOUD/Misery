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

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
        [{
            QGVAR(display) cutText ["", "PLAIN"];
        }, [], 15] call CBA_fnc_waitAndExecute;
    };

    private _totalProtection = call EFUNC(protection,totalProtection);
    private _hearingProtection = _totalProtection select 5;
    private _damageMultiplier = 0;
    private _psychModifier = 0;

    _damageMultiplier = (1 * ((1 - _hearingProtection) ^ 1.5) min 0.15) max 0;
    _psychModifier = 1 * ((1 - _hearingProtection) ^ 1.5) max 0.001;

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Damage Multiplier %1", _damageMultiplier]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Psychosis Modifier: %1", _psychModifier]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Hearing Protection: %1%2", (_hearingProtection * 100), "%"]] call EFUNC(common,debugMessage);

    if (_hearingProtection < 1) then {
        [player setHitPointDamage ["hitHead", _damageMultiplier], [player, _damageMultiplier, "head", "unknown"] call ace_medical_fnc_addDamageToUnit] select ("ace_medical" call EFUNC(common,isModLoaded));
        QGVAR(display) cutRsc [QCLASS(tunnel_ui), "PLAIN", 1, false];
    };

    if (EGVAR(psychosis,enabled)) then {
        [_psychModifier, "psychosis"] call EFUNC(common,addStatusModifier);
    };
}, 1] call CBA_fnc_addPerFrameHandler;
