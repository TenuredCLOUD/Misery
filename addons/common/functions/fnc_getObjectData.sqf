#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Retrieves config data for an object
 *
 * Arguments:
 * 0: Object <STRING>
 *
 * Return Value:
 * 0: Display name <STRING>
 * 1: Picture path <STRING>
 *
 * Example:
 * [] call misery_common_fnc_getObjectData
 *
*/

params ["_object"];

if (isNil "_object") exitWith {};

private _config = [_object] call CBA_fnc_getObjectConfig;

private _displayName = getText (_config >> "displayName");
private _picture = getText (_config >> "editorPreview");

[_displayName, _picture]

