#include "script_component.hpp"

if (hasInterface) then {
    call FUNC(managePower);
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
    "",
    ""
] call EFUNC(actions,addAction);


