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
 * [] call misery_persistence_fnc_serializeClient
*/

/*
 * ToDo
 * Add Stance, Damage / ACE Damage
 * Serialize player stats to prevent altering them
*/

private _playerData = [];
private _variables = [];

private _playerID = getPlayerUID player;

{
    private _variable = player getVariable [_x, ""];
    _variables pushBack _variable;
} forEach [MISERY_PLAYER_VARIABLES];

private _loadout = getUnitLoadout player;
private _position = getPosATL player;
private _direction = getDir player;
private _stance = stance player;
private _damage = damage player;
/*
if ACE is loaded.
private _aceDamage = [player] call ace_medical_fnc_serializeState;
*/
private _aceDamage = [];

_playerData pushBack worldName;
_playerData pushBack _playerID;
_playerData pushBack _variables;
_playerData pushBack _loadout;
_playerData pushBack _position;
_playerData pushBack _direction;
_playerData pushBack _stance;
_playerData pushBack _damage;
_playerData pushBack _aceDamage;

_playerData
