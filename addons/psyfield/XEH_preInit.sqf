#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

/*
if ((MiseryPsyFieldInit) && hasInterface) then {
    [] execVM "\z\misery\addons\psyfield\functions\fnc_Psyfieldinit.sqf";
};
*/

ADDON = true;
