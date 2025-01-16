#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [] call FUNC(infect);
};

["CAManBase", "hit", {_this call FUNC(infect)}, true, [], true] call CBA_fnc_addClassEventHandler;
