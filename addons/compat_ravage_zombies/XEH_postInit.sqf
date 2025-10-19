#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [] call FUNC(infect);
};

["CAManBase", "hit", {_this call FUNC(infect)}, true, [], true] call CBA_fnc_addClassEventHandler;

if (GVAR(specimensEnabled)) then {
    [
        "rvg_zed_skin_menu",
        "Collect specimen (skin)",
        {[[MACRO_KNIVES]] call EFUNC(common,hasItem) && ([player, ["zombie"], 2] call EFUNC(common,nearCorpse)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(skinCorpse);
        },
        "",
        QPATHTOEF(icons,data\zedhand_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "rvg_zed_saw_menu",
        "Collect specimen (saw)",
        {[[QCLASS(boneSaw)]] call EFUNC(common,hasItem) && ([player, ["zombie"], 2] call EFUNC(common,nearCorpse)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(sawCorpse);
        },
        "",
        QPATHTOEF(icons,data\zedhand_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};
