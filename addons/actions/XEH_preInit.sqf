#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (MiseryWeightcheck) then {
MiseryActions pushBack[localize "STR_MISERY_CheckGearweight", localize "STR_MISERY_CheckGearweight"];
};

ADDON = true;
