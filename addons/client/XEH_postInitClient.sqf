#include "script_component.hpp"

if (!hasInterface) exitWith {};


[] call FUNC(loadPlayerVariables);

player addEventHandler ["Respawn", {
    params ["_unit"];

    // Reset player variables, excluding bank account.
    [false] call FUNC(initializeNewPlayer);
}];
