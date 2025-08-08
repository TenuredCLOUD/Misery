#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Grabs highlighted objects and their positions from 3den editor
 * Stashes data in clipboard for easy composition building
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_grabComposition
 *
*/

private _objects = get3DENSelected "object";
if (count _objects isEqualTo 0) exitWith {systemChat "No objects selected!"};
private _referencePos = getPosASL (_objects select 0);
private _composition = [];
{
    private _class = typeOf _x;
    private _pos = getPosASL _x;
    private _relPos = _pos vectorDiff _referencePos;
    private _dir = getDir _x;
    _composition append [_class, _relPos, _dir];
} forEach _objects;

// Format as flat array: - Needed for description.ext array parsing
private _output = "";
{
    if (_forEachIndex > 0) then { _output = _output + ","; };
    if (_forEachIndex % 3 isEqualTo 0) then {
        _output = _output + format ["""%1""", _x];
    } else {
        if (_x isEqualType []) then {
            _output = _output + format ["{%1, %2, %3}", _x select 0, _x select 1, _x select 2];
        } else {
            _output = _output + format ["%1", _x];
        };
    };
} forEach _composition;

copyToClipboard _output;
systemChat "Composition copied to clipboard!";
