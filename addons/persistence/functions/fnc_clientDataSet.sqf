#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Gathers client data and saves it.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Player Data Serialized <ARRAY>
 *
 * Example:
 * [] call misery_persistence_fnc_clientDataSet
*/

private _playerID = getPlayerUID player;
private _playerVariables = call EFUNC(common,getPlayerVariables);
private _loadout = getUnitLoadout player;
private _position = getPosWorld player;
private _direction = getDir player;
private _stance = stance player;
private _damage = [player] call ACEFUNC(medical,serializeState);

private _rawArray = [
    worldName,
    _playerID,
    _playerVariables,
    _loadout,
    _position,
    _direction,
    _stance,
    _damage
];

private _namespace = [] call CBA_fnc_createNamespace;

_namespace setVariable [QGVAR(playerData), _rawArray];

private _serialized = [_namespace] call CBA_fnc_serializeNamespace;
_namespace call CBA_fnc_deleteNamespace;

_serialized
