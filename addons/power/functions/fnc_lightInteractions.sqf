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
        !(_target getVariable [QGVAR(generatorRunning), false]);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorTurnOffAction = [
    QGVAR(generator_powerOffMenu),
    localize LSTRING(Stop),
    QPATHTOEF(icons,data\power_off_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target, 0] call FUNC(powerButton);
    },
    {
        _target getVariable [QGVAR(generatorRunning), false];
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

        private _fuelLevel = _target getVariable [QGVAR(generatorFuel), 0];

        private _fuelTip = format [localize LSTRING(FuelLevel), [_fuelLevel * 100, 1, 1, false] call CBA_fnc_formatNumber, "%"];

        [[_fuelTip, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
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
        !(_target getVariable [QGVAR(generatorRunning), false]);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorSyphonAction = [
    QGVAR(generator_syphonMenu),
    localize LSTRING(SyphonFuel),
    QPATHTOEF(icons,data\droplet_off_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target] call FUNC(syphon);
    },
    {
        !(_target getVariable [QGVAR(generatorRunning), false]);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorCheckOutputAction = [
    QGVAR(generator_checkOutputMenu),
    localize LSTRING(CheckPowerOutput),
    QPATHTOEF(icons,data\zap_ca.paa),
    {
        params ["_target", "_player"];

        private _config = configOf _target;
        private _output = 0;

        if (_target getVariable [QGVAR(generatorRunning), false]) then {
            _output = getNumber (_config >> QGVAR(output));
        };

        private _powerTip = format ["%1 W | %2 kW", [_output, 1, 1, false] call CBA_fnc_formatNumber, [_output / 1000, 1, 1, false] call CBA_fnc_formatNumber];

        [[_powerTip, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _generatorConnectAction = [
    QGVAR(generator_connectMenu),
    localize LSTRING(PowerAction),
    QPATHTOEF(icons,data\plug_ca.paa),
    {
        params ["_target", "_player"];
    },
    {true},
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

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorSyphonAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorCheckOutputAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _generatorConnectAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);
