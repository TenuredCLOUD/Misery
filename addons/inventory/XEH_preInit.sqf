#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
[] call FUNC(DefineItems);

if (MiseryDefineItemsScript != "") then {
    MiserysurvivalItemEffects = [];
    MiserysurvivalItems = [];
    [] execVM MiseryDefineItemsScript;
};

if (hasInterface) then {
[] call FUNC(Inventoryhandle);
};
*/

ADDON = true;
