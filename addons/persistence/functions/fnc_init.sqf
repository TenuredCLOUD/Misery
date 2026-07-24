#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
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

if !(hasInterface) exitWith {};

[] call ACEFUNC(common,player) params ["_player"];

// If GRAD Persistence is being used, and admin actions are enabled - add actions to admins, or SP player
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

    [_player, 1, [QUOTE(ACE_SelfActions)], _gradSaveAction] call ACEFUNC(interact_menu,addActionToObject);
};

// New player or Respawned player (MP)
[QGVAR(respawnEvent), "Respawn", {
    call FUNC(newPlayer);
    if (GVAR(hardcore)) then {
        profileNamespace setVariable [ACTIVE_BANK_KEY, nil];
        ACE_player setVariable [QEGVAR(currency,bankedFunds), MACRO_PLAYER_DEFAULTS_LOW];
    };
}] call CBA_fnc_addBISPlayerEventHandler;

// Singleplayer killed handle & hardcore handle
if !(isMultiplayer) then {

    [QGVAR(killedEvent), "Killed", {

        if (GVAR(hardcore)) exitWith {
            if (!isNil "grad_persistence_blacklist") then {
                [missionName] call GRADFUNC(persistence,clearMissionData);
            };

            // Wipe All Character data & Bank
            profileNamespace setVariable [ACTIVE_PROFILE_KEY, nil];
            profileNamespace setVariable [ACTIVE_BANK_KEY, nil];
        };

        // Wipe All Character data
        profileNamespace setVariable [ACTIVE_PROFILE_KEY, nil];
    }] call CBA_fnc_addBISPlayerEventHandler;
};

// Multiplayer Combat Log Prevention (Always active in MP)
[] call FUNC(combatLogPrevention);

// SP ESC key saves
if !(isMultiplayer) then {
    [{!isNull findDisplay 46}, {
        (findDisplay 46) displayAddEventHandler ["KeyDown", {
            params ["", "_key"];
            if (_key isEqualTo DIK_ESCAPE) then {
                call FUNC(saveGame);
                if (GVAR(gradESCSave)) then {
                    [1] call FUNC(handleGrad);
                };
            };
        }];
    }] call CBA_fnc_waitUntilAndExecute;
};

// Autosaving
if (GVAR(autosaveInterval) isNotEqualTo 0) then {
    [{
        call FUNC(autoSave);
    }, [], GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;
};

// Client Load / Fresh start
// Pull Character data
private _playerData = call FUNC(loadData);

// Pull bank info
private _savedBank = profileNamespace getVariable [ACTIVE_BANK_KEY, MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(currency,bankedFunds), _savedBank];

if (_playerData isEqualTo createHashMap) exitWith {
    call FUNC(newPlayer);
    GVAR(clientLoaded) = true;
};

[_playerData] call FUNC(clientDataGet);
GVAR(clientLoaded) = true;
