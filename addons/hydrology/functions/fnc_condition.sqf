#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to allow water collection action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Water source object found <BOOL>
 * 1: Water source object <OBJECT>
 * 2: Objects data <ARRAY>
 * 3: Intersection position of looked at object <ARRAY>
 *
 * Example:
 * [] call misery_hydrology_fnc_condition;
 *
*/

[2] call EFUNC(common,getLookedAtTarget) params ["_object", "_hitPos"];

if (isNull _object) exitWith { [false, objNull, createHashMap, [0, 0, 0]] };

private _rawModel = toLower (getModelInfo _object select 0);

// strip .p3d extension off comparison
private _cleanModel = (_rawModel splitString ".") select 0;

private _matchedKey = "";
private _sourceData = createHashMap;

{
    private _key = toLower _x;

    if (_key isEqualTo _cleanModel || {_cleanModel in _key} || {_key in _cleanModel}) exitWith {
        _matchedKey = _x;
        _sourceData = GVAR(data) get _x;
    };
} forEach (keys GVAR(data));

private _found = (_matchedKey isNotEqualTo "");

[_found, _object, _sourceData, _hitPos]
