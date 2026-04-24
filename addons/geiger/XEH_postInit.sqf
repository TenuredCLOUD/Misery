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

[
    "geiger_menu",
    "Add lithium battery to geiger",
    {
        [[QCLASS(lithiumBattery), QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)
    },
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        call FUNC(batteries);
    },
    "",
    QPATHTOEF(icons,data\battery_charging_ca.paa),
    ""
] call EFUNC(actions,addAction);


