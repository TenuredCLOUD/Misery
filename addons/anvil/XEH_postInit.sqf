#include "script_component.hpp"

if !(isServer) exitWith {};

if !(isClass (missionConfigFile >> "CfgMisery_ForgeData")) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_ForgeData class not found in description.ext, skipping loading of anvil / smithing framework..."] call EFUNC(common,debugMessage);
};

if (isClass (missionConfigFile >> "CfgMisery_AnvilData")) then {
    [] call FUNC(parseData);

    [
        "anvil_menu",
        "Use Anvil",
        {[[QCLASS(anvil)], 2.5] call EFUNC(common,nearCraftingStation)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(anvil_ui);
        },
        "",
        QPATHTOEF(icons,data\ingot_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_AnvilData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
