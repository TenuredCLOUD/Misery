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

    [{
        call FUNC(autoSave);
    }, [], GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;
};

// Callback for multiplayer
if (isMultiplayer) exitWith {
    [QGVAR(loadDataFromServer), player] call CBA_fnc_serverEvent;
};

if (GVAR(singlePlayerSaveData isEqualTo [])) exitWith {
    call FUNC(newPlayer);
};

// Use direct save data for singleplayer
GVAR(singlePlayerSaveData) call FUNC(clientDataGet);
