#include "..\script_component.hpp"
/*
 * Author: MikeMF
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

if (isMultiplayer) exitWith {
    GVAR(multiplayerSaveData) = profileNamespace getVariable [GVAR(saveName), []];

    if (GVAR(multiplayerSaveData) isEqualTo []) then {
        GVAR(multiplayerSaveData) = createHashMap;
    };
};

GVAR(singlePlayerSaveData) = profileNamespace getVariable [GVAR(saveName), []];
