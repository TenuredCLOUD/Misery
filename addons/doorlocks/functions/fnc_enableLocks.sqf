#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Enables door locking logic
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_enableLocks
 *
*/

call FUNC(countDoors) params ["_doorCount", "_building"];

if (_building getVariable [QGVAR(doorsLocked), false]) exitWith {
    ["Doors are already locked...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

for "_i" from 1 to _doorCount do {
    _building setVariable [format ["bis_disabled_Door_%1", _i], 1, true];
};

_building setVariable [QGVAR(doorsLocked), true, true];

["Doors locked", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
