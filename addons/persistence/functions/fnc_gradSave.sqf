#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles GRAD server saves
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_gradSave
*/

[{
    [] call FUNC(gradSave);
}, [], GVAR(gradAutosaveTimer)] call CBA_fnc_waitAndExecute;

[GVAR(gradWarning), 0] call GRADFUNC(persistence,saveMission);

