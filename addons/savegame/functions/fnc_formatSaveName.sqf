#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Returns current save file name
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Save Name <VARIABLE>
 *
 * Example:
 * [] call misery_savegame_fnc_formatSaveName
*/

private _saveName = format [QGVAR(%1), GVAR(saveSlot)];
diag_log format ["[MISERY] - Save Name: %1", _saveName];

_saveName
