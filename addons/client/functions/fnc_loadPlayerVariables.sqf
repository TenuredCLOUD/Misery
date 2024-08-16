#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Loads player variables from profileNameSpace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_client_fnc_loadPlayerVariables
*/

// If save doesn't exist, blank slate.
if (call EFUNC(savegame,checkSaveFile)) exitWith {
    diag_log "[MISERY] - Save File is blank, creating new player.";
    call FUNC(initializeNewPlayer)
};
