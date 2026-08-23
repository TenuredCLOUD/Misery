#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Adds bury action to crate objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gear_cache_fnc_initCrates
 *
*/

if !(isServer) exitWith {};

["ReammoBox_F", "Init", {
    params ["_crate"];

    // If inheriting from "ReammoBox_F" but no carry capacity skip object
    if (maxLoad _crate <= 0) exitWith {};

    private _buryAction = [
        QGVAR(crate_menu),
        "Bury crate",
        QPATHTOEF(icons,data\shovel_ca.paa),
        {
            params ["_target", "_player"];

            // Dynamic digging duration based on crate load / size
            private _digDuration = 10 + (maxLoad _target / 100);

            [_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);

            [
                _digDuration,
                [_target, _player],
                {
                    params ["_args"];
                    _args params ["_target", "_player"];

                    private _cargoMap = [_target] call FUNC(serializeCache);

                    private _targetPos = getPosATL _target;

                    private _cacheLogic = createVehicle [QCLASS(gearCache), _targetPos, [], 0, "CAN_COLLIDE"];

                    _cacheLogic setVectorDirAndUp [_cargoMap get "containerVector" select 0, _cargoMap get "containerVector" select 1];

                    _cacheLogic setVariable [QGVAR(data), _cargoMap, true];

                    deleteVehicle _target;

                    [_player, "", 1] call ACEFUNC(common,doAnimation);

                    ["Stash buried...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
                },
                {
                    params ["_args"];
                    _args params ["_target", "_player"];

                    ["You stopped burying...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
                    [_player, "", 1] call ACEFUNC(common,doAnimation);
                },
                "Burying Cache..."
            ] call ACEFUNC(common,progressBar);
        },
        {
            params ["_target", "_player"];

            insideBuilding _player isNotEqualTo 1 && [[MACRO_SHOVELS]] call EFUNC(common,hasItem);
        },
        {},
        [],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [_crate, 0, [QUOTE(ACE_MainActions)], _buryAction] call ACEFUNC(interact_menu,addActionToObject);

}, true, [], true] call CBA_fnc_addClassEventHandler;
