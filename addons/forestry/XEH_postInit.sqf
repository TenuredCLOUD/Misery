#include "script_component.hpp"

if (GVAR(woodCollection)) then {

    GVAR(gatheredPositions) = [];

    [
        "forestryCollectWood_menu",
        localize ECSTRING(common,CollectWood),
        {([player] call EFUNC(common,nearTree)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(forageTreeAction);
        },
        "",
        QPATHTOEF(icons,data\trees_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forestrySplitLog_menu",
        localize ECSTRING(common,SplitWoodLog),
        {[[QCLASS(woodenlog)]] call EFUNC(common,hasItem)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            if !([[QCLASS(woodenlog)]] call EFUNC(common,hasItem)) exitWith {
                [QEGVAR(common,tileText), localize ECSTRING(common,NoWoodenLogsForSplitting)] call CBA_fnc_localEvent;
            };

            private _hasAxe = [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem);
            private _hasSaw = [[QCLASS(chainsaw)]] call EFUNC(common,hasItem);

            if (_hasAxe || _hasSaw) then {
                [_hasAxe, _hasSaw] call FUNC(splitWoodAction);
            } else {
                [QEGVAR(common,tileText), localize ECSTRING(common,NoWoodAxeOrChainsawNoti)] call CBA_fnc_localEvent;
            };
        },
        "",
        QPATHTOEF(icons,data\axe_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

if (GVAR(foraging)) then {

    GVAR(tinderPositions) = [];
    GVAR(digPositions) = [];

    [
        "foraging_menu",
        localize ECSTRING(common,Forage),
        {call FUNC(canForage)},
        {
            player setVariable [QEGVAR(actions,currentParentID), "foraging_menu"];
            call EFUNC(actions,displayActions);
        },
        "",
        QPATHTOEF(icons,data\leaf_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forageWorms_menu",
        localize ECSTRING(common,ForageDigForWorms),
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "foraging_menu"},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(digForWorms);
        },
        "foraging_menu",
        QPATHTOEF(icons,data\shovel_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forageTinder_menu",
        localize ECSTRING(common,ForageSearchForTinder),
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "foraging_menu"},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(searchForTinder);
        },
        "foraging_menu",
        QPATHTOEF(icons,data\shovel_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};
