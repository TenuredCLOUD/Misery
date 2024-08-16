#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if save file is new.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Is Save New <BOOL>
 *
 * Example:
 * [] call misery_savegame_fnc_checkSaveFile
*/

private _saveName = call FUNC(formatSaveName);

private _saveFile = profileNamespace getVariable [_saveName, []];
diag_log format ["Save File: %1", _saveFile];

_saveFile isEqualTo []
