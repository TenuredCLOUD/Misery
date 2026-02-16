#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Begins persistency
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_init
*/

// Setup initial save variables & start autosave
if (isServer) then {
    [] call FUNC(loadData);

    if (GVAR(autosaveInterval) isNotEqualTo 0) then {
        [{
            call FUNC(autoSave);
        }, [], GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;
    };

    if (GVAR(gradAutosaveInterval) isNotEqualTo 0) then {
        [{
            call FUNC(gradSave);
        }, [], GVAR(gradAutosaveTimer)] call CBA_fnc_waitAndExecute;
    };
};

// If GRAD Persistence is being used, and admin actions are enabled - add actions to admins, or SP player
if (GVAR(gradAdminActions)) then {
    GVAR(gradPersistenceTag) = getText (missionConfigFile >> "CfgGradPersistence" >> "missionTag");
    if (GVAR(gradPersistenceTag) isEqualTo "") then {GVAR(gradPersistenceTag) = missionName};

    [
        "grad_db_menu",
        "GRAD Persistence",
        {
            call BIS_fnc_admin isEqualTo 2 || !isMultiplayer
        },
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(grad_persistence_compat_ui);
        },
        "",
        QPATHTOEF(icons,data\savedisk_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

// New player or Respawned player
player addEventHandler ["Respawn", {
    [false] call FUNC(newPlayer);
}];

// Singleplayer hardcore
if (!isMultiplayer && GVAR(hardcore)) then {
    player addEventHandler ["Killed", {
        if (!isNil "grad_persistence_blacklist") then {
            [missionName] call grad_persistence_fnc_clearMissionData;
        };
    }];
};

// Callback for multiplayer
if (isMultiplayer) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Loading multiplayer data from server."] call EFUNC(common,debugMessage);
    [QGVAR(loadDataFromServer), player] call CBA_fnc_serverEvent;
};

// Force SP save on Escape menu
[{!isNull findDisplay 46}, {
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["", "_key"];
        if (_key isEqualTo 1) then {
            call FUNC(saveGame);
        };
    }];
}] call CBA_fnc_waitUntilAndExecute;

if (GVAR(singlePlayerSaveData) isEqualTo [] || GVAR(resetSinglePlayerSave)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "New player, no single player data found or single player data reset is enabled."] call EFUNC(common,debugMessage);
    call FUNC(newPlayer);
};

// Use direct save data for singleplayer
[QUOTE(COMPONENT_BEAUTIFIED), "Loading singleplayer data"] call EFUNC(common,debugMessage);
[GVAR(singlePlayerSaveData)] call FUNC(clientDataGet);
