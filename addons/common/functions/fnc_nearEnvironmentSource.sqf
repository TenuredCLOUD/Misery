#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generalized raycast detection for environment interactions (rocks & vegetation)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Type <NUMBER>
 * 2: Distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 1, 1] call misery_common_fnc_nearEnvironmentSource;
 *
*/

params [["_unit", player], ["_type", 1], ["_maxDistance", 1.5]];

private _unitPos = eyePos _unit;
private _unitDir = eyeDirection _unit;
private _endPos = _unitPos vectorAdd (_unitDir vectorMultiply _maxDistance);

private _intersections = lineIntersectsSurfaces [_unitPos, _endPos, _unit, objNull, true, -1, "GEOM", "NONE"];

if (_intersections isEqualTo []) exitWith {
    [false, objNull, [0, 0, 0]]
};

private _hitData = _intersections select 0;
private _hitPos = _hitData select 0;
private _object = _hitData select 2;
private _objectParent = _hitData select 3;
private _found = false;

if (_type isEqualTo 1) then {
    private _props = namedProperties _objectParent;
    private _classIndex = _props findIf {(_x select 0) isEqualTo "class"};
    if (_classIndex isNotEqualTo -1) then {
        private _value = toLower ((_props select _classIndex) select 1);
        if (["tree", "bush", "forest"] findIf {_x in _value} isNotEqualTo -1) then {
            _found = true;
        };
    };
} else {
    if (["rock", "1"] in namedProperties _objectParent) then {
        _found = true;
    };
};

[_found, _object, _hitPos]
