#include "script_component.hpp"

if (!isServer) exitWith {};

if (!GVAR(ambientWildlife)) exitWith {};

GVAR(registeredEntities) = [];

call FUNC(spawn);
call FUNC(clean);
