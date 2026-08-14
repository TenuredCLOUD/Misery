#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic search action to searchable objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_searchInteraction;
 *
*/
[] call FUNC(searchCondition) params ["_found", "_object", "_objectData", "_hitPos"];

if (_found) then {
    if (isNull GVAR(activeLogic)) then {
        GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

        GVAR(activeLogic) setPosASL _hitPos;

        private _action = [
            QGVAR(searchObject_menu),
            localize LSTRING(SearchAction),
            QPATHTOEF(icons,data\scan_search_ca.paa),
            {
                params ["", "", "_params"];
                _params params ["_realObject", "_objectData", "_hitPos"];
                [_realObject, _objectData, _hitPos] call FUNC(searchObject);
            },
            {true},
            {},
            [_object, _objectData, _hitPos],
            [0, 0, 0],
            3
        ] call ACEFUNC(interact_menu,createAction);

        [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _action] call ACEFUNC(interact_menu,addActionToObject);
    };
};

