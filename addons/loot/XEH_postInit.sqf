#include "script_component.hpp"

if (!isServer) exitWith {};

if (isClass (missionConfigFile >> "CfgMisery_LootData")) then {
    [{CBA_missionTime > 1}, {
        call FUNC(parseData);
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

    [
        "searchObject_menu",
        "Search...",
        {
            [] call FUNC(searchCondition) select 0
        },
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(searchCondition) params ["", "_object", "_objectData"];
            [_object, _objectData] call FUNC(searchObject)
        },
        "",
        QPATHTOEF(icons,data\scan_search_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_SearchableObjects class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
