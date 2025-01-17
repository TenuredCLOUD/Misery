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

[{
    [] call FUNC(autosave);
}, [], GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;

call FUNC(saveGame);
