#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_CraftingData")) then {
        [] call FUNC(parseData);

        [
            "crafting_menu",
            localize "STR_MISERY_CRAFTINGWORKBENCH",
            {[[MACRO_CRAFTINGSTATIONS], 1.5] call EFUNC(common,nearCraftingStation)},
            {
                [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
                createDialog QCLASS(craftingFramework_ui);
            },
            "",
            QPATHTOEF(icons,data\crafting_ca.paa),
            ""
        ] call EFUNC(actions,addAction);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_CraftingData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};


