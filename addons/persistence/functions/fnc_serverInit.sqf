#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Begins persistency (Server)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_serverInit
*/

[] call FUNC(loadData);

if (GVAR(autosaveInterval) isNotEqualTo 0) then {
    [{
        call FUNC(autoSave);
    }, [], GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;
};

if (GVAR(gradAutosaveInterval) isNotEqualTo 0) then {
    [{
        call FUNC(gradSave);
    }, [], GVAR(gradAutosaveTimer)] call CBA_fnc_waitAndExecute;
};

