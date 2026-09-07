#include "script_component.hpp"

if (!isServer) exitWith {};

if (GVAR(ammoRestrictions)) then {
    call FUNC(registerSmallAnimals);
};

if (!GVAR(ambientWildlife)) exitWith {};

GVAR(registeredEntities) = [];

call FUNC(spawn);
call FUNC(clean);
