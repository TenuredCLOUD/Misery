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

["Land_PortableLight_single_F", "Init", {
    params ["_lightSource"];

    _lightSource setVariable [QGVAR(powerRequired), 150, true];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_PortableLight_double_F", "Init", {
    params ["_lightSource"];

    _lightSource setVariable [QGVAR(powerRequired), 300, true];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);
}, true, [], true] call CBA_fnc_addClassEventHandler;

{
    [_x, "Init", {
        params ["_lightSource"];

        _lightSource setVariable [QGVAR(powerRequired), 10, true];

        _lightSource switchLight "OFF";

        [_lightSource, _lightSource] call ACEFUNC(common,claim);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_TENTLAMPS];

{
    [_x, "Init", {
        params ["_lightSource"];

        _lightSource setVariable [QGVAR(powerRequired), 25, true];
        _lightSource setVariable [QGVAR(batteryLevel), 0, true];

        _lightSource switchLight "OFF";

        [_lightSource, _lightSource] call ACEFUNC(common,claim);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_PORTABLELIGHT_SINGLE];

{
    [_x, "Init", {
        params ["_lightSource"];

        _lightSource setVariable [QGVAR(powerRequired), 125, true];
        _lightSource setVariable [QGVAR(batteryLevel), 0, true];

        _lightSource switchLight "OFF";

        [_lightSource, _lightSource] call ACEFUNC(common,claim);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_PORTABLELIGHT_DOUBLE];

{
    [_x, "Init", {
        params ["_lightSource"];

        _lightSource setVariable [QGVAR(powerRequired), 250, true];
        _lightSource setVariable [QGVAR(batteryLevel), 0, true];

        _lightSource switchLight "OFF";

        [_lightSource, _lightSource] call ACEFUNC(common,claim);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_PORTABLELIGHT_QUAD];

["Land_Camping_Light_off_F", "Init", {
    params ["_lightSource"];

    [_lightSource, _lightSource] call ACEFUNC(common,claim);

    private _lightSourceAction = [
        QGVAR(lightSource_TakeMenu),
        localize LSTRING(SyphonFuel),
        format [localize ECSTRING(common,TakeItem), typeOf _lightSource],
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

    [_lightSource, 0, [QUOTE(ACE_MainActions)], _lightSourceAction] call ACEFUNC(interact_menu,addActionToClass);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_Camping_Light_F", "Init", {
    params ["_lightSource"];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);

    private _lightSourceAction = [
        QGVAR(lightSource_TakeMenu),
        format [localize ECSTRING(common,TakeItem), typeOf _lightSource],
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

    [_lightSource, 0, [QUOTE(ACE_MainActions)], _lightSourceAction] call ACEFUNC(interact_menu,addActionToClass);
}, true, [], true] call CBA_fnc_addClassEventHandler;
