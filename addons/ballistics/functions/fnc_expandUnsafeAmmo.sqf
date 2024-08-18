#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Extends the unsafe ammo list for an already set Class.
 *
 * Arguments:
 * 0: Animal / Unit Classname <CLASSNAME>
 * 1: Safe Ammunitions <ARRAY>
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * ["Rabbit_F", ["B_9x21_Ball", "B_12Gauge_Pellets"]] call misery_ballistics_fnc_expandUnsafeAmmo;
*/

params ["_classname", "_unsafeAmmo"];

private _ammoList = GVAR(ballisticsMap) get _classname;

{_ammoList pushBackUnique _x} forEach _unsafeAmmo;

GVAR(ballisticsMap) set [_classname, _newAmmo];

diag_log format ["[MISERY] - Extended unsafe ammo for (%1) with (%2)", _classname, _unsafeAmmo];

_classname call FUNC(registerEventHandlers);
