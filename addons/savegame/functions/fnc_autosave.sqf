#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles autosaving
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_savegame_fnc_autosave
*/

// Attach hardcore mode logic
if (GVAR(autosaveInterval) isEqualTo 0 || GVAR(hardcore)) exitWith {
    diag_log "[MISERY] - Autosave Disabled or Hardcore mode enabled.";
};

// Replace this later, none of the single player logic should run in the MP environment
if (isMultiplayer) exitWith {
    diag_log "[MISERY] - Autosave Disabled in Multiplayer";
};

// Loop function call & save game, sets variable for last time saved.
[{
    [QGVAR(executeSaveGame)] call CBA_fnc_localEvent;
    [] call FUNC(autosave);
    player setVariable [QGVAR(lastTimeSaved), CBA_missionTime];
}, [], GVAR(autosaveInterval)] call CBA_fnc_waitAndExecute;
