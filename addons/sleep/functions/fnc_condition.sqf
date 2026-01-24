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

[2] call EFUNC(common,getLookedAtTarget) params ["_object"];

private _modelInfo = getModelInfo _object select 0;

private _vehicleConfig = "";

private _canSleepInVehicle = false;

if !(isNull objectParent player) then {
    _vehicleConfig = configOf (vehicle player);
    if (getNumber (_vehicleConfig >> "transportSoldier") > 1) then {
        _canSleepInVehicle = true;
    };
};

(vehicle player isKindOf "Car" && _canSleepInVehicle) || _modelInfo in [MACRO_BED_MODELS]
