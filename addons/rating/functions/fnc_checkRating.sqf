#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks units rating after adjustments from engine to ensure it stays 0
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rating_fnc_checkRating
*/

params ["_unit"];

[{
    private _rating = rating _this;

    if (_rating < 0) then {
        _this addRating abs(_rating);
    } else {
        _this addRating -_rating;
    };
}, _unit, 0.5] call CBA_fnc_waitAndExecute;

