#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    call FUNC(hideObjects);
};

if (hasInterface) then {
    call FUNC(switchLights);
};

ADDON = true;
