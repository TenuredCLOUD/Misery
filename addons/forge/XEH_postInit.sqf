#include "script_component.hpp"

if !(isServer) exitWith {};
    if (isClass (missionConfigFile >> "CfgMisery_ForgeData")) then {
        [] call FUNC(parseData);
        [] call FUNC(burnFuel);

        [
            "forge_menu",
            "Use Forge",
            {[[QCLASS(forge)], 2.5] call EFUNC(common,nearCraftingStation)},
            {
                [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
                createDialog QCLASS(forge_ui);
            },
            "",
            QPATHTOEF(icons,data\ingot_ca.paa),
            ""
        ] call EFUNC(actions,addAction);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ForgeData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
