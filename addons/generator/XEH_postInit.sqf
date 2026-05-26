#include "script_component.hpp"

if (isServer) then {
    call FUNC(initGenerators);
};

[QGVAR(processFuel), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(fuel);
}] call CBA_fnc_addEventHandler;

[QGVAR(processPower), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(powerNearby);
}] call CBA_fnc_addEventHandler;

[QGVAR(running), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(runLoop);
}] call CBA_fnc_addEventHandler;

[QGVAR(watchPos), {
    params ["_generator"];
    [_generator] call FUNC(trackPos);
}] call CBA_fnc_addEventHandler;

if !(hasInterface) exitWith {};

private _generatorMainAction = [
    QGVAR(generator_mainMenu),
    localize LSTRING(Action),
    QPATHTOEF(icons,data\cable_ca.paa),
    {
        params ["_target", "_player"];
    },
    {
        alive _target;
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorTurnOnAction = [
    QGVAR(generator_powerOnMenu),
    localize LSTRING(Start),
    QPATHTOEF(icons,data\power_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target, 1] call FUNC(powerButton);
    },
    {
        !(_target getVariable [QGVAR(isRunning), false]);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorTurnOffAction = [
    QGVAR(generator_powerOffMenu),
    localize LSTRING(Stop),
    QPATHTOEF(icons,data\power_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target, 0] call FUNC(powerButton);
    },
    {
        _target getVariable [QGVAR(isRunning), false];
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorCheckFuelAction = [
    QGVAR(generator_checkFuelMenu),
    localize LSTRING(CheckFuel),
    "a3\ui_f\data\igui\cfg\actions\take_ca.paa",
    {
        params ["_target", "_player"];

        private _fuelLevel = _target getVariable [QGVAR(fuelLevel), 1];

        private _fuelTip = format [localize LSTRING(FuelLevel), [_fuelLevel * 100, 1, 1, false] call CBA_fnc_formatNumber, "%"];

        [_fuelTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
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
    QPATHTOEF(markers,data\fuel_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target] call FUNC(refuel);
    },
    {
        !(_target getVariable [QGVAR(isRunning), false]);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _generatorMainAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorTurnOnAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorTurnOffAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorCheckFuelAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorRefuelAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);
