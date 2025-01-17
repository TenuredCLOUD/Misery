#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Wipes singleplayer save file data, has to be manually called.
 *
 * Arguments:
 * 0: Save File Number <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_wipeSaveSingleplayer
*/

params ["_saveFile"];

[QUOTE(COMPONENT_BEAUTIFIED), format ["Wiping Save File %1", _x]] call EFUNC(common,debugMessage);

private _saveName = format [QGVAR(%1), _saveFile];

profileNamespace setVariable [_saveName, []];
