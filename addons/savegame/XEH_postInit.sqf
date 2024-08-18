#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Event to initiate saving
[QGVAR(executeSaveGame), FUNC(savePlayerData)] call CBA_fnc_addEventHandler;

// Enable anti-combat log
[{!isNull findDisplay 46}, {call FUNC(combatLog)}] call CBA_fnc_waitUntilAndExecute;
