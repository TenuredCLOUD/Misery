#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Load client data in multiplayer
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * 0: Player Data <ARRAY>
 *
 * Example:
 * [] call misery_persistence_fnc_multiplayerDataLoad
*/

params ["_player"];

private _playerID = getPlayerUID _player;

private _playerData = GVAR(multiplayerSaveData) getOrDefault [_playerID, [], true];

[QUOTE(COMPONENT_BEAUTIFIED), format ["Loading Multiplayer data for client (%1)", _playerID]] call EFUNC(common,debugMessage);

[QGVAR(loadDataFromServerCallback), [_playerData], _player] call CBA_fnc_targetEvent;
