#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Retrieves config data for an item
 *
 * Arguments:
 * 0: Item classname <STRING>
 *
 * Return Value:
 * 0: Display name <STRING>
 * 1: Picture path <STRING>
 * 2: Short description <STRING>
 *
 * Example:
 * [] call misery_common_fnc_getItemData
 *
*/

params ["_item"];

if (isNil "_item") exitWith {};

private _config = [_item] call CBA_fnc_getItemConfig;

private _displayName = getText (_config >> "displayName");
private _picture = getText (_config >> "picture");
private _description = getText (_config >> "descriptionShort");

[_displayName, _picture, _description]
