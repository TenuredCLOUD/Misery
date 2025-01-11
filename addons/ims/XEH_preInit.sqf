#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (EGVAR(common,ims)) then {
#include "initSettings.inc.sqf"
};

ADDON = true;
