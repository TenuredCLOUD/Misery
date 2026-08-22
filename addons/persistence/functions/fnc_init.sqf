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

if !(isClass (missionConfigFile >> "CfgGradPersistence")) exitWith {};

[] call ACEFUNC(common,player) params ["_player"];

// Add GRAD save manager to SP player (if enabled)
if (GVAR(gradActions)) then {

    private _gradSaveAction = [
        QGVAR(grad_db_menu),
        localize LSTRING(GradPersistence),
        QPATHTOEF(icons,data\savedisk_ca.paa),
        {
            createDialog QCLASS(grad_persistence_compat_ui)
        },
        {
            !isMultiplayer
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_player, 1, [QUOTE(ACE_SelfActions)], _gradSaveAction] call ACEFUNC(interact_menu,addActionToObject);
};

// New player or Respawned player (MP)
[QGVAR(respawnEvent), "Respawn", {
    call FUNC(newPlayer);

    if (GVAR(hardcore)) then {
        [] call ACEFUNC(common,player) params ["_player"];

        _player setVariable [QEGVAR(currency,bankedFunds), MACRO_PLAYER_DEFAULTS_LOW];
        profileNamespace setVariable [QGVAR(activeBank), nil];
    };
}] call CBA_fnc_addBISPlayerEventHandler;

// Singleplayer killed handle & hardcore handle
if !(isMultiplayer) then {

    [QGVAR(killedEvent), "Killed", {

        [] call ACEFUNC(common,player) params ["_player"];

        if (GVAR(hardcore)) exitWith {
            // Wipe world data & Bank
            [QGVAR(wipeWorldState)] call CBA_fnc_serverEvent;
            profileNamespace setVariable [QGVAR(activeBank), nil];
        };

        // Wipe character data
        [QGVAR(wipeClient), [getPlayerUID _player]] call CBA_fnc_serverEvent;
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
                if (GVAR(enabled)) then {
                    call FUNC(saveClient);
                };
            };
        }];
    }] call CBA_fnc_waitUntilAndExecute;
};

// Pull bank info
private _savedBank = profileNamespace getVariable [QGVAR(activeBank), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(currency,bankedFunds), _savedBank];
