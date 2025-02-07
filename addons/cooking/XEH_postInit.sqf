#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

[
    "fire_menu",
    localize "STR_MISERY_USEFIRE",
    {call EFUNC(common,nearFire)},
    {
    player setVariable [QEGVAR(actions,currentParentID), "fire_menu"];
    call EFUNC(actions,displayActions);
    },
    "",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "cooking_menu",
    localize "STR_MISERY_USEFIRE_COOK",
    {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fire_menu"},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(cookingFramework_ui);
    },
    "fire_menu",
    QPATHTOEF(icons,data\boilwater_ca.paa),
    ""
] call EFUNC(actions,addAction);

