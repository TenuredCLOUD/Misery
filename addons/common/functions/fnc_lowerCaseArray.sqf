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
 * [] call misery_common_fnc_lowerCaseArray
*/

params ["_array"];

private _loweredArray = [];

{
    private _lower = toLower _x;
    _loweredArray pushBack _lower;
} forEach _array;

_loweredArray
