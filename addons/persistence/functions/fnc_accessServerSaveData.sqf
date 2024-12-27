#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Assigns server save data to variable or creates the hashmap if it didnt exist before.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_accessServerSaveData
*/

private _saveName = call FUNC(formatSaveName);

GVAR(multiplayerSaveData) = profileNamespace getVariable [_saveName, []];

if (GVAR(multiplayerSaveData) isEqualTo []) then {
    GVAR(multiplayerSaveData) = createHashMap;
};
