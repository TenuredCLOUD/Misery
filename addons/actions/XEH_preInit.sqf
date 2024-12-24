#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

GVAR(guiActions) = [];
GVAR(guiActionsMode) = "";
GVAR(guiCustomActions) = [];
GVAR(confirmDeletion) = 0;

ADDON = true;
