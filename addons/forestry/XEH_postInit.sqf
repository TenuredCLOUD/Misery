#include "script_component.hpp"

if (GVAR(woodCollection)) then {

    GVAR(gatheredPositions) = [];

    private _forestryCollectWood = [
        QGVAR(forestryCollectWood_menu),
        localize ECSTRING(common,CollectWood),
        QPATHTOEF(icons,data\trees_ca.paa),
        {
            [] call FUNC(forageTreeAction);
        },
        {
            insideBuilding player isEqualTo 0 && ([player] call EFUNC(common,nearTree)) select 0
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _forestryCollectWood] call ACEFUNC(interact_menu,addActionToObject);

    private _forestrySplitLog = [
        QGVAR(forestrySplitLog_menu),
        localize ECSTRING(common,SplitWoodLog),
        QPATHTOEF(icons,data\axe_ca.paa),
        {
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
        {
            [[QCLASS(woodenlog)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _forestrySplitLog] call ACEFUNC(interact_menu,addActionToObject);
};

if (GVAR(foraging)) then {

    GVAR(tinderPositions) = [];
    GVAR(digPositions) = [];

    private _foragingMenu = [
        QGVAR(foraging_menu),
        localize ECSTRING(common,Forage),
        QPATHTOEF(icons,data\leaf_ca.paa),
        {},
        {
            call FUNC(canForage)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _foragingMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _foragingWormsMenu = [
        QGVAR(foragingWorms_menu),
        localize ECSTRING(common,ForageDigForWorms),
        QPATHTOEF(icons,data\shovel_ca.paa),
        {
            [] call FUNC(digForWorms)
        },
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QGVAR(foraging_menu)], _foragingWormsMenu] call ACEFUNC(interact_menu,addActionToObject);

    private _foragingTinderMenu = [
        QGVAR(foragingTinder_menu),
        localize ECSTRING(common,ForageSearchForTinder),
        QPATHTOEF(icons,data\leaf_ca.paa),
        {
            [] call FUNC(searchForTinder)
        },
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QGVAR(foraging_menu)], _foragingTinderMenu] call ACEFUNC(interact_menu,addActionToObject);
};
