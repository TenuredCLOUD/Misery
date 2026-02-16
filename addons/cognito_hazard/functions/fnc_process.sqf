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

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _totalProtection = call EFUNC(protection,totalProtection);
    private _hearingProtection = _totalProtection select 5;
    private _damageMultiplier = 0;
    private _psychModifier = 0;

    if (_hearingProtection >= 1) then {
        _damageMultiplier = 0;
        _psychModifier = EGVAR(psychosis,unnaturalIncrease) / 1000; // If high protection, always make players psych degrade by lower values
    } else {
        _damageMultiplier = ((1 - _hearingProtection) / 1) / 3;
        _psychModifier = ((1 - _hearingProtection) / 1) / 3;
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Damage Multiplier %1", _damageMultiplier]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Hearing Protection: %1%2", (_hearingProtection * 100), "%"]] call EFUNC(common,debugMessage);

    if (_hearingProtection < 1) then {
        if ("ace_medical" call EFUNC(common,isModLoaded)) then {
            [player, _damageMultiplier, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
        } else {
            player setHitPointDamage ["hitHead", _damageMultiplier];
        };
    };

    if (EGVAR(psychosis,enabled)) then {
        [_psychModifier, "psychosis"] call EFUNC(common,addStatusModifier);
    };
}, 1] call CBA_fnc_addPerFrameHandler;
