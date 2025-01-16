#include "script_component.hpp"

if (isServer && isMultiplayer) then {
    call FUNC(accessServerSaveData); // Get save hashmap
    [QGVAR(saveDataMultiplayer), FUNC(savePlayerDataMultiplayer)] call CBA_fnc_addEventHandler;
    //[QGVAR(requestSaveDataClient), FUNC(loadPlayerDataMultiplayer)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Check if savefile exists when client loads in
    if (call FUNC(formatSavename) isNotEqualTo "") then {
    call FUNC(deserializeClient)
    };

    // Initiate Saving
    [QGVAR(executeSaveGame), FUNC(savePlayerData)] call CBA_fnc_addEventHandler;

    // Activate anti-combat Log.
    [{!isNull findDisplay 46}, {call FUNC(combatLogPrevention)}] call CBA_fnc_waitUntilAndExecute;

    player addEventHandler ["Respawn", {
        params ["_unit"];

        // Reset player variables, excluding bank account.
        [false] call FUNC(initializeNewPlayer);
    }];
};
