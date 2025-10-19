#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to allow mining action
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Mining object found <BOOL>
 * 1: Mining object <OBJECT>
 * 2: Objects data <ARRAY>
 *
 * Example:
 * [] call misery_mining_fnc_condition;
 *
*/

params ["_object"];

private _nearObjects = nearestTerrainObjects [_object, [], 2, true, true];
private _miningObject = objNull;
private _objectData = [];

{
    private _model = (getModelInfo _x) select 0;
    if (!isNil "_model") then {
        private _index = GVAR(miningObjects) findIf {_x select 0 isEqualTo _model};
        if (_index isNotEqualTo -1) then {
            private _pos = getPosATL _x;
            _miningObject = _x;
            _objectData = GVAR(miningObjects) select _index;
            break;
        };
    };
} forEach _nearObjects;

private _found = !isNull _miningObject;

[_found, _miningObject, _objectData]
