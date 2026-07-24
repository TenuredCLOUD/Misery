#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Loads save data into variable, updated each time the game saves.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Player Data Deserialized HashMap <HASHMAP>
 *
 * Example:
 * [] call misery_persistence_fnc_loadData
*/

if !(hasInterface) exitWith {};

private _serialized = profileNamespace getVariable [ACTIVE_PROFILE_KEY, createHashMap];

if (_serialized isEqualTo createHashMap) exitWith { createHashMap };

private _namespace = [_serialized] call CBA_fnc_deserializeNamespace;

private _saveMap = _namespace getVariable [QGVAR(activeProfileData), createHashMap];

_namespace call CBA_fnc_deleteNamespace;

_saveMap
