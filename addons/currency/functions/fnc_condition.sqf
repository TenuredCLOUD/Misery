#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check to allow water collection action
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Cache found <BOOL>
 * 1: Cache object <OBJECT>
 *
 * Example:
 * [] call misery_currency_fnc_condition;
 *
*/

params ["_object"];

private _nearObjects = nearestObjects [_object, [QCLASS(moneyCache)], 1];

if (_nearObjects isEqualTo []) exitWith {[false, objNull]};

[true, _nearObjects select 0]
