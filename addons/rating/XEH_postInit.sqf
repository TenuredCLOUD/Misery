#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};

if !(hasInterface) exitWith {};

// Override Unit rating change to 0 from rating change
player addEventHandler ["HandleRating", {
    params ["_unit", "_rating"];
    _rating = 0;
    [_unit] call FUNC(checkRating);
}];

