#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

//gasmasks +:
if (Miserygasmasks && hasInterface) then {
[] execVM "\z\misery\addons\gasmask\functions\fnc_gasmasktimer.sqf";
//Misery Gasmask audio overhaul:
[] execVM "\z\misery\addons\gasmask\functions\fnc_Gasmaskaudio.sqf";
//};
};

ADDON = true;
