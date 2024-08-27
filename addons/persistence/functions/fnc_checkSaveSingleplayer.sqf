#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks save for Single player
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_checkSaveForSinglePlayer
*/

// CONVERT TO BOOL RETURN, DOES EXIST OR NOT.

// If save doesn't exist, blank slate.
if (call FUNC(savegame,checkSaveFile)) exitWith {
    diag_log "[MISERY] - Save File is blank, creating new player.";
    call FUNC(initializeNewPlayer)
};
