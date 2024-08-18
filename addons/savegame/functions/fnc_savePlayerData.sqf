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

diag_log "[MISERY] - Saving Single Player Data";

private _playerData = call EFUNC(client,serializePlayer);

if (!isMultiplayer) then {
    private _saveName = call FUNC(formatSaveName);
    private _saveFile = profileNamespace setVariable [_saveName, _playerData];
};

// For multiplayer, create event which sends _playerData to server.
