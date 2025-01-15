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

    private _leftArea = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _totalProtection = call EFUNC(protection,totalProtection);
    private _hearingProtection = _totalProtection select 5;
    private _damageMultiplier = 0;

    if (_hearingProtection >= 1) then {
        _damageMultiplier = 0;
    } else {
        _damageMultiplier = ((1 - _hearingProtection) / 1) /10;
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Damage Multiplier %1", _damageMultiplier]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Hearing Protection: %1%2", (_hearingProtection * 100), "%"]] call EFUNC(common,debugMessage);

    // TODO: ACE Compat
    if (_hearingProtection < 1) then {
        if (EGVAR(common,ace)) then {
            [player, _damageMultiplier, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
        } else {
            player setDamage (damage player + _damageMultiplier);
        };

        if (EGVAR(fear,enabled)) then {
            private _fearAdd = MACRO_FEAR_CALC_PSYFIELD_NOPROTECTION;
            private _fear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];
            player setVariable [QCLASS(psycosis), (_fear + parseNumber ((_fearAdd)toFixed 2))];
        };
    };
}, 1] call CBA_fnc_addPerFrameHandler;
