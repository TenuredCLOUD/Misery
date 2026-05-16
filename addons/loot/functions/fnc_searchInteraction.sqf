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

[{
    params ["_args", "_handle"];

    if (!ACEGVAR(interact_menu,keydown)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        if (!isNull GVAR(activeLogic)) then {
            deleteVehicle GVAR(activeLogic);
            GVAR(activeLogic) = objNull;
        };
    };

    [] call FUNC(searchCondition) params ["_found", "_object", "_objectData", "_hitPos"];

    if (_found) then {
        if (isNull GVAR(activeLogic)) then {
            GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

            private _action = [
                QGVAR(searchObject_menu),
                localize LSTRING(SearchAction),
                QPATHTOEF(icons,data\scan_search_ca.paa),
                {
                    params ["", "", "_params"];
                    _params params ["_realObject", "_objectData"];
                    [_realObject, _objectData] call FUNC(searchObject);
                },
                {true},
                {},
                [_object, _objectData]
            ] call ACEFUNC(interact_menu,createAction);

            [GVAR(activeLogic), 0, [], _action] call ACEFUNC(interact_menu,addActionToObject);
        };

        GVAR(activeLogic) setPosASL _hitPos;

    } else {
        if (!isNull GVAR(activeLogic)) then {
            deleteVehicle GVAR(activeLogic);
            GVAR(activeLogic) = objNull;
        };
    };
}, 0] call CBA_fnc_addPerFrameHandler;
