#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Disables door locking logic
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_disableLocks
 *
*/

call FUNC(countDoors) params ["_doorCount", "_building"];

for "_i" from 1 to _doorCount do {
    _building setVariable [format ["bis_disabled_Door_%1", _i], 0, true];
};

_building setVariable [QGVAR(doorsLocked), false, true];

[localize ECSTRING(common,DoorsUnlocked), 1, [1, 1, 1, 1]] call CBA_fnc_notify;
