#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Gathers client data from savegame and resets it.
 *
 * Arguments:
 * 0: Player Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_clientDataGet
*/

params [["_playerData", []]];

_playerData params ["_worldName", "_playerID", "_variables", "_loadout", "_position", "_direction", "_stance", "_damage"];

[QUOTE(COMPONENT_BEAUTIFIED), "Loading Client Data"] call EFUNC(common,debugMessage);

// Create new player if world doesn't match.
if (worldName isNotEqualTo _worldName) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Current World (%1) does not match the current save world (%2), Loading Aborted.", worldName, _worldName]] call EFUNC(common,debugMessage);
    [] call FUNC(newPlayer);
};

// Block save sharing
private _currentPlayerID = getPlayerUID ACE_player;
if (_playerID isNotEqualTo _currentPlayerID) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format [" Current player ID (%1) does not match saved player ID (%2), Loading Aborted", _currentPlayerID, _playerID]] call EFUNC(common,debugMessage);
    [] call FUNC(newPlayer);
};

private _variableNames = [MISERY_PLAYER_VARIABLE_VALUES];

{
    private _variableName = _variableNames select _forEachIndex;
    ACE_player setVariable [_variableName, _x];
} forEach _variables;

ACE_player setUnitLoadout _loadout;
ACE_player setPosWorld _position;
ACE_player setDir _direction;

switch (_stance) do {
    case "CROUCH": {ACE_player playAction "PlayerCrouch"};
    case "PRONE": {ACE_player playAction "PlayerProne"};
    default {};
};

[ACE_player, _damage] call ACEFUNC(medical,deserializeState);
