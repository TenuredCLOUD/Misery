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

    private _searchAction = [
        QGVAR(searchObject_menu),
        "Search nearby object...",
        QPATHTOEF(icons,data\scan_search_ca.paa),
        {
            [] call FUNC(searchCondition) params ["", "_object", "_objectData"];
            [_object, _objectData] call FUNC(searchObject)
        },
        {
            [] call FUNC(searchCondition) select 0
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _searchAction] call ACEFUNC(interact_menu,addActionToObject);

} else {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_SearchableObjects class not found in description.ext, skipping data parser..."] call EFUNC(common,debugMessage);
};
