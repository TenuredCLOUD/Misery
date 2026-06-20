#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_generatorInteractions
 *
*/

private _generatorMainAction = [
    QGVAR(generator_MainMenu),
    localize LSTRING(MaintenanceAction),
    QPATHTOEF(markers,data\wrench_ca.paa),
    { },
    {alive _target},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorCheckFuelAction = [
    QGVAR(generator_checkFuelMenu),
    localize LSTRING(CheckFuel),
    "",
    {
        params ["_target", "_player"];

        [_target] call AE3FUNC(power,checkFuelLevelAction);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorCheckOutputAction = [
    QGVAR(generator_checkOutputMenu),
    localize LSTRING(CheckPowerOutput),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {
        params ["_target", "_player"];

        [_target, true] call AE3FUNC(power,getPowerOutput);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorRefuelAction = [
    QGVAR(generator_refuelMenu),
    localize LSTRING(Refuel),
    "z\ace\addons\refuel\ui\icon_refuel_interact.paa",
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(refuelGenerator);
    },
    {
        params ["_target", "_player"];
        if ([_target] call AE3FUNC(power,getPowerState) isNotEqualTo "Off") exitWith { false };

        if (fuel _target >= 1) exitWith { false };

        true
    },
    {},
    [],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorSyphonAction = [
    QGVAR(generator_syphonMenu),
    localize LSTRING(SyphonFuel),
    "z\ace\addons\refuel\ui\icon_refuel_interact.paa",
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(syphonGenerator);
    },
    {
        params ["_target", "_player"];
        if ([_target] call AE3FUNC(power,getPowerState) isNotEqualTo "Off") exitWith { false };

        if (fuel _target <= 0) exitWith { false };

        true
    },
    {},
    [],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _generatorMainAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_MainMenu)], _generatorCheckFuelAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_MainMenu)], _generatorCheckOutputAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_MainMenu)], _generatorRefuelAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_MainMenu)], _generatorSyphonAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);
