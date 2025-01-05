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
 * [] call misery_cognitohazard_fnc_process
*/

[{
    params ["_args", "_handle"];

private _totalProtection = call EFUNC(protection,totalProtection);

private _hearingProtection = _totalProtection select 5;

private _damageMultiplier = 0;

if (_hearingProtection >= 1) then {
_damageMultiplier = 0;
}else{
_damageMultiplier = ((1 - _hearingProtection) / 1);
_damageMultiplier = _damageMultiplier / 10;
};

if (EGVAR(common,debug)) then {
systemChat format ["CognitoHazard Damage Multiplier: %1", _damageMultiplier];
systemChat format ["CognitoHazard Hearing Protection: %1%2", (_hearingProtection * 100), "%"];
};

if (_hearingProtection < 1) then {

            if (EGVAR(common,ace)) then {
                [player, _damageMultiplier, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
            } else {
                private _damage = damage player;
                player setDamage (_damage + _damageMultiplier);
            };

            if (EGVAR(fear,enabled)) then {
            private _fearadd = MACRO_FEAR_CALC_PSYFIELD_NOPROTECTION;
            player setVariable [QCLASS(psycosis), (_MFear + parseNumber ((_fearadd)toFixed 2))];
            };
        };

    private _leftArea = GVAR(areas) findIf {player inArea _x} == -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
