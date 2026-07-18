#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Condition for sleep action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Near bed object, or terrainObject, or ACE_player is in a ground vehicle, or cursorObject model matches bed model macro <BOOL>
 *
 * Example:
 * [] call misery_sleep_fnc_sleepCondition
 *
*/

[2] call EFUNC(common,getLookedAtTarget) params ["_object"];

private _modelInfo = "";

if (!isNull _object) then {
    _modelInfo = (getModelInfo _object) select 0;
};

private _vehicleConfig = "";

private _canSleepInVehicle = false;

if !(isNull objectParent ACE_player) then {
    _vehicleConfig = configOf (vehicle ACE_player);
    if (getNumber (_vehicleConfig >> "transportSoldier") > 1) then {
        _canSleepInVehicle = true;
    };
};

(vehicle ACE_player isKindOf "Car" && _canSleepInVehicle) || _modelInfo in [MACRO_BED_MODELS]
