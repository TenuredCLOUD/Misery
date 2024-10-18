#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Destroys a corpse shot with unsafe ammo, classname should be XEH compatible.
 * Ammo registering is done on the server only.
 *
 * Arguments:
 * 0: Animal / Unit Classname <CLASSNAME>
 * 1: Safe Ammunitions <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Rabbit_F", ["B_9x21_Ball", "B_12Gauge_Pellets"]] call misery_ballistics_fnc_registerUnsafeAmmo;
*/

if (!isServer) exitWith {};

params ["_classname", "_unsafeAmmo"];

// Add if key returns default value.
if (_classname call FUNC(isKeyDefault)) exitWith {
    GVAR(ballisticsMap) set [_classname, _unsafeAmmo];
    _classname call FUNC(registerEventHandlers);
};

// Expand value if exists
[_classname, _unsafeAmmo] call FUNC(expandUnsafeAmmo);
