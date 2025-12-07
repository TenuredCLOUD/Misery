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

    if (isGamePaused) exitWith {};

    private _leftArea = GVAR(areas) findIf {player inArea _x} isEqualTo -1;

    if (_leftArea) exitWith {
        player setVariable [QGVAR(insideArea), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "_skinProtection", "_respiratoryProtection", "_eyeProtection", "_hearingProtection"];

    private _skinDeficit = (MACRO_BASE_CHEMICAL_DOSE * ((1 - _skinProtection) ^ 1.5)) max 0;
    private _respiratoryDeficit = (MACRO_BASE_CHEMICAL_DOSE * ((1 - _respiratoryProtection) ^ 1.5)) max 0;
    private _eyeDeficit = (MACRO_BASE_CHEMICAL_DOSE * ((1 - _eyeProtection) ^ 1.5)) max 0;
    private _randomPartAce = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
    private _randomPart = ["hitHead", "hitBody", "hitHands", "hitLegs"];

    private _finalSkinDeficit = _skinDeficit / 3;
    private _finalRespiratoryDeficit = _respiratoryDeficit / 3;
    private _finalEyeDeficit = _eyeDeficit / 3;

    private _fatigueValue = [getFatigue player, player getVariable ["ace_advanced_fatigue_aimFatigue", 0]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});

    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        if (_skinProtection < 1) then {
            [player, _finalSkinDeficit, selectRandom _randomPartAce, "burn"] call ace_medical_fnc_addDamageToUnit;
        };
        if (_respiratoryProtection < 1) then {
            [player, _finalRespiratoryDeficit, "Body", "burn"] call ace_medical_fnc_addDamageToUnit;
            [player setFatigue (_fatigueValue + 1), player setVariable ["ace_advanced_fatigue_aimFatigue", _fatigueValue + 1]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});
        };
        if (_eyeProtection < 1) then {
            [player, _finalEyeDeficit, "Head", "burn"] call ace_medical_fnc_addDamageToUnit;
        };
    } else {
        if (_skinProtection < 1) then {
            player setHitPointDamage [selectRandom _randomPart, _finalSkinDeficit];
        };
        if (_respiratoryProtection < 1) then {
            player setHitPointDamage ["hitBody", _finalRespiratoryDeficit];
            [player setFatigue (_fatigueValue + 1), player setVariable ["ace_advanced_fatigue_aimFatigue", _fatigueValue + 1]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});
        };
        if (_eyeProtection < 1) then {
            player setHitPointDamage ["hitHead", _finalEyeDeficit];
        };
    };

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Chemical Area Protection: Skin %1%4, Respiratory %2%4, Eye %3%4", (_skinProtection * 100), (_respiratoryProtection * 100), (_eyeProtection * 100), "%"]] call EFUNC(common,debugMessage);
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Damage Modifiers: Skin: %1, Respiratory: %2, Eye: %3", _finalSkinDeficit, _finalRespiratoryDeficit, _finalEyeDeficit]] call EFUNC(common,debugMessage);
}, 1] call CBA_fnc_addPerFrameHandler;
