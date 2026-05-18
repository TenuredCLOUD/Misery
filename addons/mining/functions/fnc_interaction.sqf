#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic action to mining objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_mining_fnc_interaction;
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

    [] call FUNC(condition) params ["_found", "_miningObject", "_objectData", "_hitPos"];

    if (_found) then {
        if (isNull GVAR(activeLogic)) then {
            GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

            private _action = [
                QGVAR(mineOre_menu),
                localize LSTRING(Action),
                QPATHTOEF(icons,data\pickaxe_ca.paa),
                {
                    params ["", "", "_params"];
                    _params params ["_found", "_obj", "_data"];
                    [_found, _obj, _data] call FUNC(action);
                },
                {true},
                {},
                [_found, _miningObject, _objectData]
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
