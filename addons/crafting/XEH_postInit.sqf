#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_CraftingData")) then {
        [] call FUNC(parseData);

        private _craftingAction = [
            QGVAR(crafting_menu),
            localize ECSTRING(common,CraftingWorkbench),
            QPATHTOEF(icons,data\hammer_ca.paa),
            {
                params ["_target", "_player"];
                createDialog QCLASS(craftingFramework_ui);
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        {
            [_x, 0, [QUOTE(ACE_MainActions)], _craftingAction] call ACEFUNC(interact_menu,addActionToClass);
        } forEach [MACRO_CRAFTINGSTATIONS];
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_CraftingData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};


