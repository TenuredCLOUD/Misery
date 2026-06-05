#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * BatteryPack interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_batteryPackInteractions
 *
*/

private _batteryBankMainAction = [
    QGVAR(generator_mainMenu),
    localize LSTRING(UseDevice),
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

private _batteryBankTurnOnAction = [
    QGVAR(generator_powerOnMenu),
    localize LSTRING(TurnOn),
    QPATHTOEF(icons,data\power_ca.paa),
    {
        params ["_target", "_player"];
        [_target, typeOf _target, 1] call FUNC(powerButton);
    },
    {
        ((_target getVariable [QGVAR(batteryLevel), 0]) > 0);
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _batteryBankTurnOffAction = [
    QGVAR(generator_powerOffMenu),
    localize LSTRING(TurnOff),
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

private _batteryBankCheckBatteryAction = [
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

private _batteryBankCheckOutputAction = [
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

private _batteryBankConnectAction = [
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
    [_x, 0, [QUOTE(ACE_MainActions)], _batteryBankMainAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _batteryBankTurnOnAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _batteryBankTurnOffAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _batteryBankCheckBatteryAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _batteryBankCheckOutputAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(generator_mainMenu)], _batteryBankConnectAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(batteryBanks);
