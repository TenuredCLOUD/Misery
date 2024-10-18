#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Value to Bar conversion
 *
 * Arguments:
 * 0: Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_value] call misery_common_fnc_valToBar;
 *
*/

    params ["_value"];
    private _bar = "";
    private _length = round(_value / 5);
    for "_i" from 1 to _length do {
        _bar = _bar + "-";
    };
    _bar

