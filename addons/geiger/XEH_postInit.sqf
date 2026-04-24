#include "script_component.hpp"

if (hasInterface) then {
    call FUNC(managePower);
};

if !(isServer) exitWith {};

private _addBatterytoGeiger = [
    QGVAR(geiger_menu),
    "Add lithium battery to geiger",
    QPATHTOEF(icons,data\battery_charging_ca.paa),
    {
        call FUNC(batteries)
    },
    {
        [[QCLASS(lithiumBattery), QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)
    }
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _addBatterytoGeiger] call ace_interact_menu_fnc_addActionToObject;


