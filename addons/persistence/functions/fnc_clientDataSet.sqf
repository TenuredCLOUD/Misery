#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Gathers client data and saves it.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Player Data Serialized <HASHMAP>
 *
 * Example:
 * [] call misery_persistence_fnc_clientDataSet
*/

if !(hasInterface) exitWith {};

[] call ACEFUNC(common,player) params ["_player"];

if (isNull _player) exitWith {};

private _position = getPosWorld _player;

if (_position isEqualTo [0, 0, 0]) exitWith {};

private _playerVariables = call EFUNC(common,getPlayerVariables);
private _loadout = getUnitLoadout _player;
private _direction = getDir _player;
private _stance = stance _player;
private _damage = [_player] call ACEFUNC(medical,serializeState);

private _saveMap = createHashMapFromArray [
    ["worldName", worldName],
    ["variables", _playerVariables],
    ["loadout", _loadout],
    ["position", _position],
    ["direction", _direction],
    ["stance", _stance],
    ["damage", _damage]
];

private _namespace = [] call CBA_fnc_createNamespace;

_namespace setVariable [QGVAR(activeProfileData), _saveMap];

private _serialized = [_namespace] call CBA_fnc_serializeNamespace;

_namespace call CBA_fnc_deleteNamespace;

_serialized
