#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(zombieTypes) = [
    "zombie_walker",
    "zombie_runner",
    "zombie_bolter"
];

#include "initSettings.inc.sqf"

ADDON = true;
