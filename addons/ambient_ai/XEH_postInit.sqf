#include "script_component.hpp"

if (!isServer) exitWith {};

if (!GVAR(enabled)) exitWith {};

GVAR(registeredEntities) = [];

call FUNC(convertToArray);
call FUNC(spawn);
call FUNC(clean);
call FUNC(patrol);
