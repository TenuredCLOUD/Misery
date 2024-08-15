#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

/*
//Phantom artifact drops:
if (MiseryPhantDrops && isServer) then {
    [] execVM "\z\misery\addons\phantoms\functions\fnc_phantomdrops.sqf";
};
*/

ADDON = true;
