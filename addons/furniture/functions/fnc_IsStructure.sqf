#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Grabs number of doors from object config confirming if object is a structure or not
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: isStructure <BOOL>
 *
 * Example:
 * [] call misery_furniture_fnc_IsStructure
 *
*/

params ["_object"];

if !(_object isKindOf "House") exitWith { false };

private _config = [_object] call CBA_fnc_getObjectConfig;

private _doorCount = getNumber (_config >> "numberOfDoors");

if (_doorCount > 0) exitWith { true };

false
