#include "script_component.hpp"

if (hasInterface) then {
    // Safety fallback if active geiger is in players inventory (on load / reload)
    [{!isNull player && !isNull findDisplay 46}, {
        if ([[QCLASS(geiger_On)]] call EFUNC(common,hasItem)) then {
            [player, [QCLASS(geiger_On), QCLASS(geiger_Off)], false] call EFUNC(common,switchPowerState);
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
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
] call ACEFUNC(interact_menu,createAction);

[player, 1, [QUOTE(ACE_SelfActions)], _addBatterytoGeiger] call ACEFUNC(interact_menu,addActionToObject);


