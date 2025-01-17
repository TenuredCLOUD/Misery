#include "script_component.hpp"

GVAR(autosaveTimer) = GVAR(autosaveInterval) * 60;
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

call FUNC(init);

// New player or Respawned player
player addEventHandler ["Respawn", {
    [false] call FUNC(newPlayer);
}];

// Force SP save on Escape menu
if (!isMultiplayer) then {
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        [{
            if (!isNull findDisplay 49) then {
                call FUNC(saveGame);
            };
        }, [], 0.5] call CBA_fnc_waitAndExecute;
    }];
};
