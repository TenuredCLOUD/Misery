#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Saves Player Data to profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_savegame_fnc_savePlayerData
*/

private _playerData = [] call EFUNC(client,serializePlayer);
private _saveName = call FUNC(formatSaveName);
private _saveFile = profileNamespace setVariable [_saveName, _playerData];
