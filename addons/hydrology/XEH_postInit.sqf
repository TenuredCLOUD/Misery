#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_HydrologyData")) then {
        [] call FUNC(parseData);

        [
            "hydrology_menu",
            localize "STR_MISERY_COLLECTWATER",
            {call EFUNC(common,nearWell)},
            {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(hydrology_ui);
            },
            "",
            QPATHTOEF(icons,data\waves_arrow_up_ca.paa),
            ""
        ] call EFUNC(actions,addAction);

    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_HydrologyData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};
