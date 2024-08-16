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
 * [] call misery_client_fnc_deserializePlayer
*/

private _saveName = call EFUNC(savegame,formatSaveName);
private _playerData = profileNamespace getVariable [_saveName, []];

_playerData params ["_worldName", "_variables", "_loadout", "_position"];

// Figure out what to do in this scenario, loading failed, create new player?
if (worldName != _worldName) exitWith {
    diag_log format ["[MISERY] - Current World (%1) does not match the current save world (%2), Loading Aborted.", worldName, _worldName];
};

private _variableNames = [MISERY_PLAYER_VARIABLE_VALUES];

{
    private _variableName = _variableNames select _forEachIndex;
    player setVariable [_variableName, _x];
} forEach _variables;

player setUnitLoadout _loadout;
player setPosATL _position;
