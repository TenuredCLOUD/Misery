#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Calculates player gear weight
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Weight factor (0–1) <NUMBER>
 *
 * Example:
 * [] call misery_weight_fnc_calculated;
 *
 * Public: No
*/

private _maxLoad = getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
private _weightFactor = (loadAbs player / _maxLoad) min 1; // 0–1, capped at max load

_weightFactor
