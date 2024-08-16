#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Event to initiate saving
[QGVAR(executeSaveGame), FUNC(savePlayerData)] call CBA_fnc_addEventHandler;
