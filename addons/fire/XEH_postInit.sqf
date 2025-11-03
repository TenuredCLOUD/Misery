#include "script_component.hpp"

[
    "fireCrafting_menu",
    "Craft fire",
    {call FUNC(condition)},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        createDialog QCLASS(fireCrafting_ui);
    },
    "",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "fire_menu",
    localize "STR_MISERY_USEFIRE",
    {call EFUNC(common,nearFire) params ["_nearestFire"]; _nearestFire isNotEqualTo []},
    {
        player setVariable [QEGVAR(actions,currentParentID), "fire_menu"];
        call EFUNC(actions,displayActions);
        call FUNC(addData);
    },
    "",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "fireStatus_menu",
    "Check fire",
    {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fire_menu"},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        createDialog QCLASS(fireCrafting_ui);
        player setVariable [QEGVAR(actions,currentParentID), ""];
        call EFUNC(actions,displayActions);
    },
    "fire_menu",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    ""
] call EFUNC(actions,addAction);

if (isServer) then {

    GVAR(activeFires) = [];
    publicVariable QGVAR(activeFires);

    call FUNC(manage);
};
