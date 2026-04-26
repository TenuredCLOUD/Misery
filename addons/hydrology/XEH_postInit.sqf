#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_HydrologyData")) then {
        [] call FUNC(parseData);

        private _hydrologyAction = [
            QGVAR(hydrology_menu),
            localize ECSTRING(common,CollectWater),
            QPATHTOEF(icons,data\waves_arrow_up_ca.paa),
            {
                params ["_target", "_player"];
                createDialog QCLASS(hydrology_ui);
            },
            {true},
            {},
            ["_target", "_player"],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        {
            [_x, 0, [QUOTE(ACE_MainActions)], _hydrologyAction] call ACEFUNC(interact_menu,addActionToClass);
        } forEach GVAR(waterSources);

    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_HydrologyData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};
