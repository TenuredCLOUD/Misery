#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Safezone:
if (isNil "MiseryinSafezonearea") then {MiseryinSafezonearea = false}; 

ADDON = true;
