#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

if (MiseryWeightcheck) then {
MiseryActions pushBack[localize "STR_MISERY_CheckGearweight", localize "STR_MISERY_CheckGearweight"];
};

ADDON = true;
