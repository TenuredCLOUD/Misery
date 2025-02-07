#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Weight calculation
 * Calculates players gear weight
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_weight_fnc_calculated;
 *
 * Public: No
*/

private _bagWeightLoad = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
private _playerWeight = round(_bagWeightLoad * 100);
private _weightCalculated = (((_playerWeight) / 10) / 10) / 10;

_weightCalculated
