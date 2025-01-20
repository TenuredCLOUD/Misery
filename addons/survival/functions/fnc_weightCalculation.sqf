#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Weight calculation
 * Calculated players gear weight
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_weightCalculation;
 *
 * Public: No
*/

private _bagWeightLoad = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
private _playerWeight = round(_bagWeightLoad * 100);
private _weightCalculated = MACRO_WEIGHTCALC(_playerWeight);

_weightCalculated
