#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes dynamic light sources that can be placeable with other systems
 * Removes ACE interactions for light cycling (on/off) to prep sources for power component
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_initLightSources;
 *
 * Public: No
*/

["Land_Camping_Light_off_F", "Init", {
    params ["_lightSource"];

    [_lightSource, _lightSource] call ACEFUNC(common,claim);

    private _lightSourceAction = [
        QGVAR(lightSource_TakeMenuLantern),
        format [localize ECSTRING(common,TakeItem), [_lightSource] call EFUNC(common,getObjectData) select 0],
        "a3\ui_f\data\igui\cfg\actions\take_ca.paa",
        {
            params ["_target", "_player"];
            deleteVehicle _target;
            [_player, QCLASS(lantern_NoBattery), true] call CBA_fnc_addItem;
        },
        {true},
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [_lightSource, 0, [QUOTE(ACE_MainActions)], _lightSourceAction] call ACEFUNC(interact_menu,addActionToObject);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_Camping_Light_F", "Init", {
    params ["_lightSource"];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);

    private _lightSourceAction = [
        QGVAR(lightSource_TakeMenuLantern_1),
        format [localize ECSTRING(common,TakeItem), [_lightSource] call EFUNC(common,getObjectData) select 0],
        "a3\ui_f\data\igui\cfg\actions\take_ca.paa",
        {
            params ["_target", "_player"];
            deleteVehicle _target;
            [_player, QCLASS(lantern_NoBattery), true] call CBA_fnc_addItem;
        },
        {true},
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [_lightSource, 0, [QUOTE(ACE_MainActions)], _lightSourceAction] call ACEFUNC(interact_menu,addActionToObject);
}, true, [], true] call CBA_fnc_addClassEventHandler;
