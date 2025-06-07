#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ailment damage modifier
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Damage <NUMBER>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_ailmentDamage;
 *
*/

params ["_object", "_value", "_bodyPart"];

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [_object, _value, _bodyPart, "unknown", objNull, [], true] call ace_medical_fnc_addDamageToUnit;
    } else {
        _totalDamage = (damage _object) + _value;
        _object setDamage _totalDamage;
    };
