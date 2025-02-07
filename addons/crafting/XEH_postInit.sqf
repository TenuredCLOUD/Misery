#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

[
    "crafting_menu",
    localize "STR_MISERY_CRAFTINGWORKBENCH",
    {[[MACRO_CRAFTINGSTATIONS], 1.5] call EFUNC(common,nearCraftingStation)},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(craftingFramework_ui);
    },
    "",
    QPATHTOEF(icons,data\crafting_ca.paa),
    ""
] call EFUNC(actions,addAction);

