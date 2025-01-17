#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Gathers client data and saves it.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Player Data <ARRAY>
 *
 * Example:
 * [] call misery_persistence_fnc_clientDataSet
*/

/*
 * ToDo
 * Serialize player stats to prevent altering them
*/

private _playerData = [];
private _variables = [];

private _playerID = getPlayerUID player;

private _playerVariables = call EFUNC(common,getPlayerVariables);

private _loadout = getUnitLoadout player;
private _position = getPosATL player;
private _direction = getDir player;
private _stance = stance player;

private _damage = [damage player, [player] call ace_medical_fnc_serializeState] select ["ace_medical"] call EFUNC(common,isModLoaded);

_playerData pushBack worldName;
_playerData pushBack _playerID;
_playerData pushBack _playerVariables;
_playerData pushBack _loadout;
_playerData pushBack _position;
_playerData pushBack _direction;
_playerData pushBack _stance;
_playerData pushBack _damage;

_playerData
