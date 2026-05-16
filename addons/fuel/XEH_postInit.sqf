#include "script_component.hpp"

if (!isNil QACEGVAR(refuel,enabled) && ACEGVAR(refuel,enabled)) exitWith {};

private _allFuelStations = [MACRO_FUELSTATIONS_LAND] + [MACRO_FUELSTATIONS_AIR];

private _fuelPumpAction = [
    QGVAR(fuel_pump_menu),
    localize LSTRING(Action),
    QPATHTOEF(markers,data\fuel_ca.paa),
    {},
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _fuelPumpAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach _allFuelStations;

private _refuelPumpAction = [
    QGVAR(refuel_pump_menu),
    localize LSTRING(RefuelAtPump),
    QPATHTOEF(markers,data\fuel_ca.paa),
    {
        createDialog QCLASS(refuelVehicle_ui)
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(fuel_pump_menu)], _refuelPumpAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach _allFuelStations;

private _refillPumpAction = [
    QGVAR(refuel_fuelCan_pump_menu),
    localize LSTRING(RefillFuelCanAtPump),
    QPATHTOEF(markers,data\fuel_ca.paa),
    {
        createDialog QCLASS(refuelfuelCan_ui)
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(fuel_pump_menu)], _refillPumpAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach _allFuelStations;
