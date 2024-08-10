#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

MiseryWaterSources=[
"well",
"watertank",
"watercooler",
"barrelwater",
"waterbarrel",
"stallwater",
"waterpump",
"waterfountain",
"pumpa"//CHR redux /CUP
];

ADDON = true;
