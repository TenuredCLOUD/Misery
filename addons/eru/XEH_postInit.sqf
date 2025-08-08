#include "script_component.hpp"

if (hasInterface) then {
    call FUNC(managePower);
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
    "",
    ""
] call EFUNC(actions,addAction);
