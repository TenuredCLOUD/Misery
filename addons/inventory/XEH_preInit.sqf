#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

[] call FUNC(DefineItems);

if (MiseryDefineItemsScript != "") then {
    MiserysurvivalItemEffects = [];
    MiserysurvivalItems = [];
    [] execVM MiseryDefineItemsScript;
};

if (hasInterface) then {
[] call FUNC(Inventoryhandle);
};

ADDON = true;