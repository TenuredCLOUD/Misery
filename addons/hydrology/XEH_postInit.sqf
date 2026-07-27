#include "script_component.hpp"

if (isClass (missionConfigFile >> "CfgMisery_HydrologyData")) then {
    if (isServer) then {
        call FUNC(parseData);
    };
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_HydrologyData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
