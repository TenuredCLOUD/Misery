#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to add search action for nearby searchable objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Searchable object found <BOOL>
 * 1: Searchable object <OBJECT>
 * 2: Object Data from missionConfig <ARRAY>
 * 3: Intersection position of looked at object <ARRAY>
 *
 * Example:
 * [] call misery_loot_fnc_searchCondition;
 *
*/

[1] call EFUNC(common,getLookedAtTarget) params ["_object", "_hitPos"];

if (isNull _object) exitWith {[false, objNull, [], [0, 0, 0]]};

private _modelInfo = getModelInfo _object select 0;

private _searchableObject = objNull;
private _objectData = [];

private _index = GVAR(searchableObjects) findIf {_x select 0 isEqualTo _modelInfo};

if (_index isNotEqualTo -1) then {

    private _pos = getPosATL _object;

    _searchableObject = _object;
    _objectData = GVAR(searchableObjects) select _index;
};

private _found = !isNull _searchableObject;

[QUOTE(COMPONENT_BEAUTIFIED), format ["SearchCondition - Object: %1, Found: %2, SearchableObject: %3", _object, _found, _searchableObject]] call EFUNC(common,debugMessage);

[_found, _searchableObject, _objectData, _hitPos]
