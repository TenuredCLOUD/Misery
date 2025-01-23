#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
[player] call FUNC(loop);
}] call CBA_fnc_addEventHandler;
