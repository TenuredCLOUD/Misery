#include "script_component.hpp"

if (GVAR(woodCollection)) then {
    [
        "forestryChopWood_menu",
        localize "STR_MISERY_CHOPWOOD",
        {call EFUNC(common,nearTreeAxe)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            if ([["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe",QCLASS(woodaxe)]] call EFUNC(common,hasItem)) then {
                [] call FUNC(axeAction);
            } else {
                private _noAxeForWoodStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_NOAXEFORWOODNOTI"];
                [QEGVAR(common,tileText), _noAxeForWoodStr] call CBA_fnc_localEvent;
            };
        },
        "",
        QPATHTOEF(icons,data\firewood_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forestrySawWood_menu",
        localize "STR_MISERY_SAWWOOD",
        {call EFUNC(common,nearTreeSaw)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            if !([[QCLASS(chainsaw)]] call EFUNC(common,hasItem)) then {
                private _noChainsawForWoodStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_NOCHAINSAWFORWOODNOTI"];
                [QEGVAR(common,tileText), _noChainsawForWoodStr] call CBA_fnc_localEvent;
            } else {
                [] call FUNC(sawAction);
            };
        },
        "",
        QPATHTOEF(icons,data\chainsaw_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "forestryCollectWood_menu",
        localize "STR_MISERY_COLLECTWOOD",
        {call EFUNC(common,nearTree)},
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
                private _noWoodLogForSplitStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_NOWOODENLOGSFORSPLITTING"];
                [QEGVAR(common,tileText), _noWoodLogForSplitStr] call CBA_fnc_localEvent;
            };

            if ([[QCLASS(chainsaw), "WBK_axe", "WBK_brush_axe", "WBK_craftedAxe", "FireAxe", "Axe", QCLASS(woodaxe)]] call EFUNC(common,hasItem)) then {
                [] call FUNC(splitWoodAction);
            } else {
                private _noAxeOrSawForLogStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_NOWOODAXEORCHAINSAWNOTI"];
                [QEGVAR(common,tileText), _noAxeOrSawForLogStr] call CBA_fnc_localEvent;
            };
        },
        "",
        QPATHTOEF(icons,data\firewood_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

if (GVAR(foraging)) then {
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
