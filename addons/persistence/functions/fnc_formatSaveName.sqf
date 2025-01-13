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
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Multiplayer Save Name: %1", _saveName]] call EFUNC(common,debugMessage);
} else {
    private _saveName = format [QGVAR(%1), GVAR(saveSlot)];
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Singleplayer Save Name: %1", _saveName]] call EFUNC(common,debugMessage);
};

_saveName
