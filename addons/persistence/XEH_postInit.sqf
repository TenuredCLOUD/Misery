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

GVAR(blockSave) = false;

["CBA_settingsInitialized", {
    [] call FUNC(init);
}] call CBA_fnc_addEventHandler;
