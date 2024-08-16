#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Serialize player for savegame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Player Data <ARRAY>
 *
 * Example:
 * [] call misery_client_fnc_serializePlayer
*/

/*
 * ToDo
 * Add Stance, Damage / ACE Damage
 * Serialize player stats to prevent altering them
*/

private _playerData = [];
private _variables = [];

// Variables done in specific order.
{
    private _variable = player getVariable [_x, ""];
    _variables pushBack _variable;
} forEach [MISERY_PLAYER_VARIABLES];

private _loadout = getUnitLoadout player;
private _position = getPosATL player;

_playerData pushBack worldName;
_playerData pushBack _variables;
_playerData pushBack _loadout;
_playerData pushBack _position;

_playerData
