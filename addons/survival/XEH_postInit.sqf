#include "script_component.hpp"

["CBA_settingsInitialized", {
if (!hasInterface) exitWith {};

[player] call FUNC(loop);

}] call CBA_fnc_addEventHandler;