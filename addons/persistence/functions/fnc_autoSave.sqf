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
 * [] call misery_persistence_fnc_autosave
*/

// Attach hardcore mode logic
if (GVAR(autosaveInterval) isEqualTo 0 || GVAR(hardcore)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Autosave disabled or Hardcore mode enabled."] call EFUNC(common,debugMessage);
};

// Number of minutes * 60
[{
    [] call FUNC(autosave);
}, [], GVAR(autosaveInterval) * 60] call CBA_fnc_waitAndExecute;

if (isMultiplayer) exitWith {
    [QGVAR(saveDataMultiplayer)] call CBA_fnc_serverEvent;
};

[QGVAR(executeSaveGame)] call CBA_fnc_localEvent;
