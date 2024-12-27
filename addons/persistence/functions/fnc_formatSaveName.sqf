#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Returns current save file name
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Save Name <VARIABLE>
 *
 * Example:
 * [] call misery_persistence_fnc_formatSaveName
*/

private _saveName = "";

if (isMultiplayer) then {
    private _saveName = format [QGVAR(%1), worldName];
    diag_log format ["[MISERY] - Multiplayer Save Name: %1", _saveName];
} else {
    private _saveName = format [QGVAR(%1), GVAR(saveSlot)];
    diag_log format ["[MISERY] - Singleplayer Save Name: %1", _saveName];
};

_saveName
