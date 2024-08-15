#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

/*
if (Miseryzedinfect && hasInterface) then {
    [] execVM "\z\misery\addons\zinfect\functions\fnc_zinfection.sqf"; //Zed infection pre-checks in file
};
*/

ADDON = true;
