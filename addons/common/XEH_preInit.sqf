#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

GVAR(modLoadedCache) = createHashMap;
GVAR(chromEffect) = false;

call FUNC(modLoadedPrep);

ADDON = true;
