#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Lowercases an array
 *
 * Arguments:
 * 0: Input Array <ARRAY>
 *
 * Return Value:
 * 0: Lower cased array <ARRAY>
 *
 * Example:
 * [] call misery_fnc_common_lowerCaseArray
*/

params ["_array"];

{
    private _lower = toLower _x;
    _array set [_forEachIndex, _lower];
} forEach _array;

_array
