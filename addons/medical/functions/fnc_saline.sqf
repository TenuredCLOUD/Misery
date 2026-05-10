#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Saline rehydration utilizing ACE medical API
 *
 * Arguments:
 * 0: Flow rate <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_saline;
 *
*/

params ["_flowRate"];

// ACE internal constant for mL/s
private _aceBaseFlow = 4.1667;

private _hydrationPerML = 0.0001;

// Grab mL transfused this exact cycle
private _mlTransfused = _flowRate * _aceBaseFlow;

private _hydrationRate = _mlTransfused * _hydrationPerML;

[_hydrationRate, "thirst"] call EFUNC(common,addStatusModifier);
