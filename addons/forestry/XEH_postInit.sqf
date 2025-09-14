#include "script_component.hpp"

if (GVAR(woodCollection)) then {

    GVAR(gatheredPositions) = [];

    [
        "forestryCollectWood_menu",
        localize "STR_MISERY_COLLECTWOOD",
        {([player] call EFUNC(common,nearTree)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(forageTreeAction);
        },
        "",
        QPATHTOEF(icons,data\branch_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forestrySplitLog_menu",
        localize "STR_MISERY_SPLITWOODLOG",
        {[[QCLASS(woodenlog)]] call EFUNC(common,hasItem)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            if !([[QCLASS(woodenlog)]] call EFUNC(common,hasItem)) exitWith {
                [QEGVAR(common,tileText), localize "STR_MISERY_NOWOODENLOGSFORSPLITTING"] call CBA_fnc_localEvent;
            };

            private _hasAxe = [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem);
            private _hasSaw = [[QCLASS(chainsaw)]] call EFUNC(common,hasItem);

            if (_hasAxe || _hasSaw) then {
                [_hasAxe, _hasSaw] call FUNC(splitWoodAction);
            } else {
                [QEGVAR(common,tileText), localize "STR_MISERY_NOWOODAXEORCHAINSAWNOTI"] call CBA_fnc_localEvent;
            };
        },
        "",
        QPATHTOEF(icons,data\firewood_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

if (GVAR(foraging)) then {

    GVAR(tinderPositions) = [];
    GVAR(digPositions) = [];

    [
        "foraging_menu",
        localize "STR_MISERY_FORAGE",
        {call FUNC(canForage)},
        {
            player setVariable [QEGVAR(actions,currentParentID), "foraging_menu"];
            call EFUNC(actions,displayActions);
        },
        "",
        "",
        ""
    ] call EFUNC(actions,addAction);

    [
        "forageWorms_menu",
        localize "STR_MISERY_FORAGE_DIGFORWORMS",
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "foraging_menu"},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(digForWorms);
        },
        "foraging_menu",
        "",
        ""
    ] call EFUNC(actions,addAction);

    [
        "forageTinder_menu",
        localize "STR_MISERY_FORAGE_SEARCHFORTINDER",
        {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "foraging_menu"},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            [] call FUNC(searchForTinder);
        },
        "foraging_menu",
        "",
        ""
    ] call EFUNC(actions,addAction);
};
