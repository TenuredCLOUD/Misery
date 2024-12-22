#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
[] call FUNC(DefineItems);

if (MiseryDefineItemsScript != "") then {
    MiserysurvivalItemEffects = [];
    MiserysurvivalItems = [];
    [] call MiseryDefineItemsScript;
};

if (hasInterface) then {
[] call FUNC(Inventoryhandle);
};
*/

ADDON = true;
