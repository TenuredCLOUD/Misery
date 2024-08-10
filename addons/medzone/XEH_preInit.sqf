#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Medical zone:
if (isNil "MiseryinMedzonearea") then {MiseryinMedzonearea = false}; 

ADDON = true;
