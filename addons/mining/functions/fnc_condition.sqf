#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to allow mining action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Mining object found <BOOL>
 * 1: Mining object <OBJECT>
 * 2: Objects data <ARRAY>
 * 3: Intersection position of looked at object <ARRAY>
 *
 * Example:
 * [] call misery_mining_fnc_condition;
 *
*/

[2] call EFUNC(common,getLookedAtTarget) params ["_object", "_hitPos"];

if (isNull _object) exitWith {[false, objNull, [], [0, 0, 0]]};

private _modelInfo = getModelInfo _object select 0;

private _miningObject = objNull;
private _objectData = [];

private _index = GVAR(miningObjects) findIf {_x select 0 isEqualTo _modelInfo};

if (_index isNotEqualTo -1) then {

    private _pos = getPosATL _object;

    _miningObject = _object;
    _objectData = GVAR(miningObjects) select _index;
};

private _found = !isNull _miningObject;

[_found, _miningObject, _objectData, _hitPos]
