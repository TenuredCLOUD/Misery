#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Loads save data into variable, updated each time the game saves.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_loadData
*/

private _saveNameString = call FUNC(formatSaveName);

private _serialized = profileNamespace getVariable [_saveNameString, ""];

if (_serialized isEqualTo "") exitWith { [] };

private _namespace = [_serialized] call CBA_fnc_deserializeNamespace;

private _playerData = _namespace getVariable [QGVAR(playerData), []];

_namespace call CBA_fnc_deleteNamespace;

_playerData
