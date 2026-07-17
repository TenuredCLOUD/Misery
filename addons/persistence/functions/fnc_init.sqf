#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
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

// If GRAD Persistence is being used, and admin actions are enabled - add actions to admins, or SP ACE_player
if (GVAR(gradAdminActions)) then {
    GVAR(gradPersistenceTag) = getText (missionConfigFile >> "CfgGradPersistence" >> "missionTag");
    if (GVAR(gradPersistenceTag) isEqualTo "") then {GVAR(gradPersistenceTag) = missionName};

    private _gradSaveAction = [
        QGVAR(grad_db_menu),
        localize LSTRING(GradPersistence),
        QPATHTOEF(icons,data\savedisk_ca.paa),
        {
            createDialog QCLASS(grad_persistence_compat_ui)
        },
        {
            call BIS_fnc_admin isEqualTo 2 || !isMultiplayer
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _gradSaveAction] call ACEFUNC(interact_menu,addActionToObject);
};

// New player or Respawned player
ACE_player addEventHandler ["Respawn", {
    [false] call FUNC(newPlayer);
}];

// Singleplayer hardcore
if (!isMultiplayer) then {
    ACE_player addEventHandler ["Killed", {

        if (GVAR(hardcore)) exitWith {
            if (!isNil "grad_persistence_blacklist") then {
                [missionName] call GRADFUNC(persistence,clearMissionData);
            };

            // Wipe All Character data
            private _saveNameString = call FUNC(formatSaveName);
            profileNamespace setVariable [_saveNameString, nil];
        };

        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "_bankedFunds"];

        // Cache bank funds to a fresh profileNamespace var for retrieval on restart
        profileNamespace setVariable [QGVAR(cachedBank), _bankedFunds];

        // Wipe All Character data
        private _saveNameString = call FUNC(formatSaveName);
        profileNamespace setVariable [_saveNameString, nil];
    }];
};

// Multiplayer Combat Log Prevention
if (isMultiplayer) then {
    [] call FUNC(combatLogPrevention);
};

[{!isNull findDisplay 46}, {
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["", "_key"];
        if (_key isEqualTo 1) then {
            call FUNC(saveGame);
            if (GVAR(gradESCSave)) then {
                [1] call FUNC(handleGrad);
            };
        };
    }];
}] call CBA_fnc_waitUntilAndExecute;

private _playerData = call FUNC(loadData);

if (_playerData isEqualTo []) exitWith {
    [true] call FUNC(newPlayer);
};

[_playerData] call FUNC(clientDataGet);
