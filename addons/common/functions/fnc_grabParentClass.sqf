#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Grabs highlighted objects and their parent class / inheritance from 3den editor
 * Stashes data in clipboard for easy entity listing
 * Can be used on many placed entities at once
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_grabParentClass
 *
*/

private _selected = get3DENSelected "object";

if (_selected isEqualTo []) exitWith {systemChat "No objects selected..."};

private _parents = _selected apply {configName (inheritsFrom (configOf _x))};

copyToClipboard str _parents;

systemChat format ["Copied parents: %1", _parents];
