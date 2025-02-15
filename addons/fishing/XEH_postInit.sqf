#include "script_component.hpp"

if (GVAR(enabled)) then {
    [
        "fishing_menu",
        localize "STR_MISERY_STARTFISHING",
        {call FUNC(canFish)},
        {
            player setVariable [QEGVAR(actions,currentParentID), "fishing_menu"];
            call EFUNC(actions,displayActions);
        },
        "",
        QPATHTOEF(icons,data\fish_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "fishingAction_menu",
        localize "STR_MISERY_STARTFISHINGACT",
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fishing_menu"},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(action);
        },
        "fishing_menu",
        QPATHTOEF(icons,data\fish_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "fishingRequirements_menu",
        localize "STR_MISERY_STARTFISHINGREQUIRMENTS",
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fishing_menu"},
        {
            private _fishingItemsReqStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STARTFISHINGREQUIRMENTS_LISTED"];
            [QEGVAR(common,tileText), _fishingItemsReqStr] call CBA_fnc_localEvent;
        },
        "fishing_menu",
        QPATHTOEF(icons,data\fish_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};
