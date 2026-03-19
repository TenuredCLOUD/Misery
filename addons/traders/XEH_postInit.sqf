#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_TradersData")) then {
        call FUNC(trackTraders);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_TradersData class not found in description.ext, skipping..."] call EFUNC(common,debugMessage);
    };
};
