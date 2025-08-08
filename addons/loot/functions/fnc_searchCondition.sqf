#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to add search action for nearby searchable objects
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Searchable object found <BOOL>
 * 1: Searchable object <OBJECT>
 *
 * Example:
 * [] call misery_loot_fnc_searchCondition;
 *
*/

params ["_object"];

private _nearObjects = nearestTerrainObjects [_object, [], 2, true, true];
private _searchableObject = objNull;
private _objectData = [];

{
    private _model = (getModelInfo _x) select 0;
    if (!isNil "_model") then {
        private _index = GVAR(searchableObjects) findIf {_x select 0 isEqualTo _model};
        if (_index isNotEqualTo -1) then {
            private _pos = getPosATL _x;
            _searchableObject = _x;
            _objectData = GVAR(searchableObjects) select _index;
            break;
        };
    };
} forEach _nearObjects;

private _found = !isNull _searchableObject;

[QUOTE(COMPONENT_BEAUTIFIED), format ["SearchCondition - Object: %1, Found: %2, SearchableObject: %3", _object, _found, _searchableObject]] call EFUNC(common,debugMessage);

[_found, _searchableObject, _objectData]

