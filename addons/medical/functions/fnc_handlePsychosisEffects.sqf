#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Psychosis tracker for ACE medical API
 * Used for Psychosis exposure to simulate brain damage
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Psychosis <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handlePsychosisEffects;
 *
*/

params ["_unit", "_psychosis"];

private _woundSize = round (linearConversion [0.75, 1, _psychosis, 0, 2, true]);

private _bruiseCount = round (linearConversion [0.75, 1, _psychosis, 1, 4, true]);

private _woundDamage = linearConversion [0.75, 1, _psychosis, 0.1, 1, false];

[_unit, "head", ["Contusion", _bruiseCount, _woundSize, _woundDamage]] call ACEFUNC(medical,addWound);
