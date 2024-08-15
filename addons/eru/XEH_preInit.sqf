#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

/*
if (MiseryERUacts && hasInterface) then {
[] execVM "\z\misery\addons\eru\functions\fnc_ERU_main.sqf";
};
*/

ADDON = true;
