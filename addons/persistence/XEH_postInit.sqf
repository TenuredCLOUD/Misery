#include "script_component.hpp"

GVAR(autosaveTimer) = GVAR(autosaveInterval) * 60;
GVAR(gradAutosaveTimer) = GVAR(gradAutosaveTimer) * 60;
GVAR(saveName) = call FUNC(formatSaveName);

// Multiplayer save/load
if (isServer) then {
    [QGVAR(saveDataToServer), FUNC(multiplayerDataSave)] call CBA_fnc_addEventHandler;
    [QGVAR(loadDataFromServer), FUNC(multiplayerDataLoad)] call CBA_fnc_addEventHandler;
};

[QGVAR(loadDataFromServerCallback), {
    params ["_playerData"];

    if (_playerData isEqualTo []) exitWith {
        [true] call FUNC(newPlayer);
    };

    _playerData call FUNC(clientDataGet);
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(blockSave) = false;

["CBA_settingsInitialized", {
    [] call FUNC(init);

    if (!isNil "grad_persistence_blacklist" && GVAR(gradAdminActions)) then {
        [
            "grad_db_menu",
            "GRAD Persistence",
            {call BIS_fnc_admin isEqualTo 2 || !isMultiplayer},
            {},
            "",
            QPATHTOEF(icons,data\savedisk_ca.paa),
            ""
        ] call EFUNC(actions,addAction);

        [
            "grad_db_save_menu",
            "Manually save world state",
            {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "grad_db_menu"},
            {
                [GVAR(gradWarning), 0] call grad_persistence_fnc_saveMission;
            },
            "grad_db_menu",
            "",
            ""
        ] call EFUNC(actions,addAction);

        [
            "grad_db_wipe_menu",
            "Manually wipe world state",
            {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "grad_db_menu"},
            {
                ["You are about to wipe your world state, continue...?", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
            },
            "grad_db_menu",
            "",
            ""
        ] call EFUNC(actions,addAction);

        [
            "grad_db_confirm_wipe_menu",
            "Yes - I want to wipe the world data now",
            {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "grad_db_wipe_menu"},
            {
                [missionName] call grad_persistence_fnc_clearMissionData;
            },
            "grad_db_wipe_menu",
            "",
            ""
        ] call EFUNC(actions,addAction);
    };
}] call CBA_fnc_addEventHandler;
