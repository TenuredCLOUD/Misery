#include "script_component.hpp"

if !(isServer) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_HydrologyData")) then {
    [] call FUNC(parseData);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_HydrologyData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
