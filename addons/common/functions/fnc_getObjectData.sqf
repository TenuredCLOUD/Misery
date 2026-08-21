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

// If object is something like a backpack, grab it's regular picture
if (_picture isEqualTo "") then {
    _picture = getText (_config >> "picture");
};

// If no picture defined, just keep the return blank
if (_picture in ["pictureStaticObject", "pictureThing"]) then {
    _picture = "";
};

[_displayName, _picture]
