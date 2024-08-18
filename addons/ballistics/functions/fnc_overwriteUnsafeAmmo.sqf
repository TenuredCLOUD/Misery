#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Public method to overwrite previously set definitions completely.
 *
 * Arguments:
 * 0: Animal / Unit Classname <CLASSNAME>
 * 1: New ammunition <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Rabbit_F", ["B_9x21_Ball", "B_12Gauge_Pellets"]] call misery_ballistics_fnc_overwriteUnsafeAmmo
*/

params ["_classname", "_unsafeAmmo"];

// Exit if classname isn't registered
if (_classname call FUNC(isKeyDefault)) exitWith {
    diag_log format ["[MISERY] - Unsafe ammo class cannot be overwritten because it does not exist for (%1)", _classname];
};

// Overwrite
GVAR(ballisticsMap) set [_classname, _unsafeAmmo];
