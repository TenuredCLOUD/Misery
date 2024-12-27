#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles autosaving in single player
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_autosave
*/

if (isMultiplayer) exitWith {};

// Attach hardcore mode logic
if (GVAR(autosaveInterval) isEqualTo 0 || GVAR(hardcore)) exitWith {
    diag_log "[MISERY] - Autosave Disabled or Hardcore mode enabled.";
};

// Loop function call & save game, sets variable for last time saved.
[{
    [QGVAR(executeSaveGame)] call CBA_fnc_localEvent;
    [] call FUNC(autosave);
}, [], GVAR(autosaveInterval)] call CBA_fnc_waitAndExecute;
