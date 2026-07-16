#include "script_component.hpp"

if (isServer) then {
    if (isClass (missionConfigFile >> "CfgMisery_InteractionData")) then {
        [] call FUNC(parseData);
    } else {
        [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_InteractionData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
    };
};

if (!hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(init);
}] call CBA_fnc_addEventHandler;

