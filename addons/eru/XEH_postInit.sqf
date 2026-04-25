#include "script_component.hpp"

if (hasInterface) then {
    // Safety fallback if active eru is in players inventory (on load / reload)
    [{!isNull player && !isNull findDisplay 46}, {
        if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
            [player, [QCLASS(eru_On), QCLASS(eru_Off)], false] call EFUNC(common,switchPowerState);
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
};

if !(isServer) exitWith {};

[
    "eru_menu",
    "Add lithium battery to ERU",
    {
        [[QCLASS(lithiumBattery), QCLASS(eru_NoBattery)]] call EFUNC(common,hasItem)
    },
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        call FUNC(batteries);
    },
    "",
    QPATHTOEF(icons,data\battery_charging_ca.paa),
    ""
] call EFUNC(actions,addAction);
