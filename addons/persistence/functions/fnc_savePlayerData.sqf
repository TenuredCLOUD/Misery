#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Saves Player Data to profileNamespace, or send data to server for multiplayer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_savePlayerData
*/

diag_log "[MISERY] - Saving Single Player Data";

private _playerData = call FUNC(serializeClient);

if (!isMultiplayer) exitWith {
    private _saveName = call FUNC(formatSaveName);
    private _saveFile = profileNamespace setVariable [_saveName, _playerData];
};

// For multiplayer, create event which sends _playerData to server.
[QGVAR(saveDataMultiplayer), _playerData] call CBA_fnc_serverEvent;
