#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic action to money caches
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_interaction;
 *
*/

[ACE_player] call FUNC(condition) params ["_found", "_cacheObject"];

if (_found) then {

    GVAR(activeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

    private _cachePos = getPosATL _cacheObject;

    GVAR(activeLogic) setPosATL _cachePos;

    private _action = [
        QGVAR(cache_menu),
        "Use cache",
        QPATHTOEF(icons,data\shovel_ca.paa),
        {
            params ["_target", "_player", "_params"];
            _params params ["_cacheObject"];

            createDialog QCLASS(cache_ui);
            [_cacheObject] call FUNC(cacheRefresh);
            _player setVariable [QGVAR(currentCache), _cacheObject];
        },
        {
            [[QCLASSACE(EntrenchingTool)]] call EFUNC(common,hasItem)
        },
        {},
        [_cacheObject],
        [0, 0, 0],
        1
    ] call ACEFUNC(interact_menu,createAction);

    [GVAR(activeLogic), 0, [QUOTE(ACE_MainActions)], _action] call ACEFUNC(interact_menu,addActionToObject);
};
