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
 * [] call misery_persistence_fnc_multiplayerDataSave
*/

params ["_playerData"];
_playerData params ["_worldName", "_playerID"];

[QUOTE(COMPONENT_BEAUTIFIED), format ["Saving Multiplayer data for client (%1)", _playerID]] call EFUNC(common,debugMessage);

// Save ID as key with all data.
GVAR(multiplayerSaveData) set [_playerID, _playerData];

profileNamespace setVariable [GVAR(saveName), GVAR(multiplayerSaveData)];
