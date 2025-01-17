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
    [QUOTE(COMPONENT_BEAUTIFIED), "Refreshing Multiplayer Data Map"] call EFUNC(common,debugMessage);
    GVAR(multiplayerSaveData) = profileNamespace getVariable [GVAR(saveName), []];

    if (GVAR(multiplayerSaveData) isEqualTo []) then {
        GVAR(multiplayerSaveData) = createHashMap;
    };
};

[QUOTE(COMPONENT_BEAUTIFIED), "Refreshing Singleplayer Data Map"] call EFUNC(common,debugMessage);
GVAR(singlePlayerSaveData) = profileNamespace getVariable [QGVAR(saveName), []];
