#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Gathers client data from savegame and resets it.
 *
 * Arguments:
 * 0: Player Data Deserialized <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_clientDataGet
*/

params [["_saveMap", createHashMap]];

if !(hasInterface) exitWith {};

if (_saveMap isEqualTo createHashMap) exitWith {
    call FUNC(newPlayer);
};

[] call ACEFUNC(common,player) params ["_player"];

[QUOTE(COMPONENT_BEAUTIFIED), "Loading Client Data from HashMap"] call EFUNC(common,debugMessage);

private _savedWorld = _saveMap getOrDefault ["worldName", ""];
private _variables = _saveMap getOrDefault ["variables", []];
private _loadout = _saveMap getOrDefault ["loadout", []];
private _position = _saveMap getOrDefault ["position", []];
private _direction = _saveMap getOrDefault ["direction", 0];
private _stance = _saveMap getOrDefault ["stance", "STAND"];
private _damage = _saveMap getOrDefault ["damage", []];

if (worldName isNotEqualTo _savedWorld) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Current World (%1) does not match saved world (%2). Aborting.", worldName, _savedWorld]] call EFUNC(common,debugMessage);
    call FUNC(newPlayer);
};

private _variableNames = [MISERY_PLAYER_VARIABLE_VALUES];
{
    private _variableName = _variableNames select _forEachIndex;
    _player setVariable [_variableName, _x];
} forEach _variables;

_player setUnitLoadout _loadout;

_player setPosWorld _position;

_player setDir _direction;

switch (_stance) do {
    case "STAND": {[_player, "PlayerStand", 2] call ACEFUNC(common,doAnimation)};
    case "CROUCH": {[_player, "PlayerCrouch", 2] call ACEFUNC(common,doAnimation)};
    case "PRONE": {[_player, "PlayerProne", 2] call ACEFUNC(common,doAnimation)};
    default {};
};

[_player, _damage] call ACEFUNC(medical,deserializeState);
