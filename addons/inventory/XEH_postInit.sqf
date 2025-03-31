#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_ItemData")) then {
        [] call FUNC(parseItemData);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ItemData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};

if (!hasInterface) exitWith {};

[] call FUNC(defineItems);

if (GVAR(defineItemsScript) isNotEqualTo "") then {
    GVAR(itemEffects) = [];
    GVAR(items) = [];
    [] call GVAR(defineItemsScript);
};

[] call FUNC(inventoryHandle);

