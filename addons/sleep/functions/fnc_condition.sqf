#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Condition for sleep action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Player in safe vehicle <BOOL>
 * 1: Found <BOOL>
 * 2: Sleeping Object <OBJECT>
 * 3: Intersection position of looked at object <ARRAY>
 *
 * Example:
 * [] call misery_sleep_fnc_condition
 *
*/

[5] call EFUNC(common,getLookedAtTarget) params ["_object", "_hitPos"];

if (isNull _object && isNull objectParent ACE_player) exitWith {[false, false, objNull, [0, 0, 0]]};

private _modelInfo = getModelInfo _object select 0;

private _sleepingObject = objNull;

private _index = [MACRO_BED_MODELS] findIf {_x isEqualTo _modelInfo};

if (_index isNotEqualTo -1) then {
    _sleepingObject = _object;
};

private _found = !isNull _sleepingObject;

private _vehicleConfig = "";

private _canSleepInVehicle = false;

if !(isNull objectParent ACE_player) then {
    _vehicleConfig = configOf (objectParent ACE_player);
    if (getNumber (_vehicleConfig >> "transportSoldier") > 1) then {
        _canSleepInVehicle = true;
    };
};

[(objectParent ACE_player isKindOf "Car" && _canSleepInVehicle), _found, _sleepingObject, _hitPos]
