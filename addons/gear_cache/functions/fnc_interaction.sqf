#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic action to gear caches
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gear_cache_fnc_interaction;
 *
*/

[ACE_player] call FUNC(condition) params ["_found", "_cacheObject"];

if (_found) then {

    GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

    private _cachePos = getPosATL _cacheObject;

    GVAR(activeLogic) setPosATL _cachePos;

    private _action = [
        QGVAR(cache_menu),
        "Unbury cache",
        QPATHTOEF(icons,data\shovel_ca.paa),
        {
            params ["_target", "_player", "_params"];
            _params params ["_cacheObject"];

            private _cacheData = _cacheObject getVariable [QGVAR(data), createHashMap];

            private _digDuration = _cacheData get "digDuration";

            [_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);

            [
                _digDuration,
                [_target, _player, _cacheObject],
                {
                    params ["_args"];
                    _args params ["_target", "_player", "_cacheObject"];

                    private _cacheData = _cacheObject getVariable [QGVAR(data), createHashMap];

                    private _class = _cacheData get "containerClass";

                    private _pos = _cacheData get "containerPos";

                    private _vector = _cacheData get "containerVector";

                    private _newCrate = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];

                    _newCrate setVectorDirAndUp _vector;

                    [_newCrate, _cacheData] call FUNC(deserializeCache);

                    deleteVehicle _cacheObject;

                    [_player, "", 1] call ACEFUNC(common,doAnimation);

                    ["Stash unburied...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
                },
                {
                    params ["_args"];
                    _args params ["_target", "_player", "_cacheObject"];

                    ["You stop digging...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
                    [_player, "", 1] call ACEFUNC(common,doAnimation);
                },
                "Digging up cache..."
            ] call ACEFUNC(common,progressBar);
        },
        {
            [[MACRO_SHOVELS]] call EFUNC(common,hasItem)
        },
        {},
        [_cacheObject],
        [0, 0, 0],
        1
    ] call ACEFUNC(interact_menu,createAction);

    [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _action] call ACEFUNC(interact_menu,addActionToObject);
};
