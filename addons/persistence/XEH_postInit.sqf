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
