#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Condition for sleep action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Near bed object, or terrainObject, or player is in a ground vehicle, or cursorObject model matches bed model macro <BOOL>
 *
 * Example:
 * [] call misery_sleep_fnc_sleepCondition
 *
*/

private _nearObjects = nearestObjects [player, [MACRO_BEDS], 2.5];

private _nearTerrainObjects = nearestTerrainObjects [player, [MACRO_BEDS], 2.5];

private _object = cursorObject;

private _model = getModelInfo _object select 0;

private _vehicleConfig = "";

private _canSleepInVehicle = false;

if !(isNull objectParent player) then {
    _vehicleConfig = configOf (vehicle player);
    if (getNumber (_vehicleConfig >> "transportSoldier") > 1) then {
        _canSleepInVehicle = true;
    };
};

_nearObjects isNotEqualTo [] || _nearTerrainObjects isNotEqualTo [] || (vehicle player isKindOf "Car" && _canSleepInVehicle) || _model in [MACRO_BED_MODELS]
