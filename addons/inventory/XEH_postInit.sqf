#include "script_component.hpp"

if (!hasInterface) exitWith {};

[] call FUNC(defineItems);

if (GVAR(defineItemsScript) != "") then {
    GVAR(itemEffects) = [];
    GVAR(items) = [];
    [] call GVAR(defineItemsScript);
};

[] call FUNC(inventoryHandle);

