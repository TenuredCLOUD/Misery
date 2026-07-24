#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * ACE tags hashmap sync for GRAD
 * Merges current save iteration cache into the master list, then wipes cache for next save
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_syncSprayTags
*/

if (!isServer) exitWith {};

if (count GVAR(sprayTagsCached) isEqualTo 0) exitWith {};

private _masterPersistentMap = missionNamespace getVariable [QGVAR(sprayTagsList), createHashMap];

_masterPersistentMap merge GVAR(sprayTagsCached);

missionNamespace setVariable [QGVAR(sprayTagsList), _masterPersistentMap, true];

// Wipe cached tag hash so merge data isn't duplicated next save write
GVAR(sprayTagsCached) = createHashMap;
