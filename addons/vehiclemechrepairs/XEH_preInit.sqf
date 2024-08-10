#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Repair zone:
if (isNil "MiseryinVehiclerepairarea") then {MiseryinVehiclerepairarea = false}; 

ADDON = true;
