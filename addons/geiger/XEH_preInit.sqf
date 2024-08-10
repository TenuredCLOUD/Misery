#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (MiseryGeigeracts && hasInterface) then {
[] execVM "\z\misery\addons\geiger\functions\fnc_GeigerBar.sqf";
};

ADDON = true;
