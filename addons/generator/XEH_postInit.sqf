#include "script_component.hpp"

if (isServer) then {
    [
        "generator_menu",
        "Use Generator",
        {
            [player] call FUNC(nearGenerator) select 0
        },
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(generator_ui);
        },
        "",
        QPATHTOEF(icons,data\cable_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};
