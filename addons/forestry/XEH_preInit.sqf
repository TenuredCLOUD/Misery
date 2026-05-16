#include "script_component.hpp"

ADDON = false;

GVAR(gatheredPositions) = [];
GVAR(tinderPositions) = [];
GVAR(digPositions) = [];
GVAR(activeTreeLogic) = objNull;
GVAR(activeForagingLogic) = objNull;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

ADDON = true;
