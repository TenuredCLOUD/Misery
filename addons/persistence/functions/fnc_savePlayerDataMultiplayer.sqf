#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Server saves player data as hashmap using player UID as key.
 *
 * Arguments:
 * 0: Player Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_savePlayerDataMultiplayer
*/

params ["_playerData"];
_playerData params ["_worldName", "_playerID"];

[QUOTE(COMPONENT_BEAUTIFIED), "Saving Multiplayer data"] call EFUNC(common,debugMessage);

// Save ID as key with all data.
GVAR(multiplayerSaveData) set [_playerID, _playerData];

private _saveName = call FUNC(formatSaveName);
profileNamespace setVariable [_saveName, GVAR(multiplayerSaveData)];
