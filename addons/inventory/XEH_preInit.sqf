#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

GVAR(items) = [];
GVAR(itemEffects) = [];
GVAR(itemCustomActions) = [];

/*
[] call FUNC(DefineItems);

if (MiseryDefineItemsScript != "") then {
    GVAR(itemEffects) = [];
    GVAR(items) = [];
    [] call MiseryDefineItemsScript;
};

if (hasInterface) then {
[] call FUNC(Inventoryhandle);
};
*/

ADDON = true;
