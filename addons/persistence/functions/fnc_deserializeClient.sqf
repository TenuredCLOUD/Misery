#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Deserialize player from savegame.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_deserializeClient
*/

private _playerData = [];

if (!isMultiplayer) then {
    private _saveName = call FUNC(formatSaveName);
    _playerData = profileNamespace getVariable [_saveName, []];
} else {
    [QGVAR(requestSaveDataClient), player] call CBA_fnc_serverEvent;
};

_playerData params ["_worldName", "_playerID", "_variables", "_loadout", "_position", "_direction", "_stance", "_damage", "_aceDamage"];

// Create new player if world doesn't match.
if (worldName != _worldName) exitWith {
    diag_log format ["[MISERY] - Current World (%1) does not match the current save world (%2), Loading Aborted.", worldName, _worldName];
    [] call FUNC(initializeNewPlayer);
};

// Block save sharing
private _currentPlayerID = getPlayerUID player;
if !(_playerID isEqualTo _currentPlayerID) exitWith {
    diag_log format ["[MISERY] - Current player ID (%1) does not match saved player ID (%2), Loading Aborted", _currentPlayerID, _playerID];
    [] call FUNC(initializeNewPlayer);
};

private _variableNames = [MISERY_PLAYER_VARIABLE_VALUES];

{
    private _variableName = _variableNames select _forEachIndex;
    player setVariable [_variableName, _x];
} forEach _variables;

player setUnitLoadout _loadout;
player setPosATL _position;
player setDir _direction;

switch (_stance) do {
    case "CROUCH": {player playAction "PlayerCrouch"};
    case "PRONE": {player playAction "PlayerProne"};
    default {};
};

player setDamage _damage;

/*
if ACE medical is loaded, load ACE damage.
[player, _aceDamage] call ace_medical_fnc_deserializeState;
*/
