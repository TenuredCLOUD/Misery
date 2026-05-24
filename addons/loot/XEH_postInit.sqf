#include "script_component.hpp"

if (!isServer) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_LootData")) then {
    [{CBA_missionTime > 1}, {
        call FUNC(parseData);
        if (isClass (missionConfigFile >> "CfgGradFortifications")) then {
            call FUNC(parseGradFortData);
        };
        call FUNC(checkAreas);

        [{
            [] call FUNC(loop)
        }, [], 1] call CBA_fnc_waitAndExecute;
    }, []] call CBA_fnc_waitUntilAndExecute;
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_LootData class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};

if (isClass (missionConfigFile >> "CfgMisery_SearchableObjects")) then {
    [] call FUNC(parseSearchData);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_SearchableObjects class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};

