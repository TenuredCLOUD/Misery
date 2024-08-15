#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

/*
//Traders
if (MiseryDynamicMarketsActive && isServer) then {
    [] execVM "\z\misery\addons\traders\functions\fnc_TrackTraders.sqf";
};
*/

ADDON = true;
