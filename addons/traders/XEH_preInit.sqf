#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

//Prestart for Trader varname tracking:
GVAR(activeTraders) = [];

/*
//Traders
if (MiseryDynamicMarketsActive && isServer) then {
    [] call "\z\misery\addons\traders\functions\fnc_TrackTraders.sqf";
};
*/

ADDON = true;
