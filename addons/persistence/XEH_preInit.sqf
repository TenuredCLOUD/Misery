#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

GVAR(autosaveInterval) = GVAR(autosaveInterval) * 60;

GVAR(gradAutosaveTimer) = GVAR(gradAutosaveInterval) * 60;

ADDON = true;
