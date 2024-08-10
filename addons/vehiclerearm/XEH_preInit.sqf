#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Resupply zone:
if (isNil "MiseryinVehiclerearmarea") then {MiseryinVehiclerearmarea = false}; 

ADDON = true;
