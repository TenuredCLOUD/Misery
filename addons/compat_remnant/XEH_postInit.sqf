#include "script_component.hpp"

if !(isServer) exitWith {};

if (GVAR(enabled)) then {
call FUNC(drops)
};
