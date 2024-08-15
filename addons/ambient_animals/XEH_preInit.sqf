#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"
/*
//Ambient Wildlife
if (MiseryAmbientWildlife && isServer) then {
[] execVM "\z\misery\addons\ambient_animals\functions\fnc_AmbientAnimals.sqf";
};
*/
ADDON = true;
