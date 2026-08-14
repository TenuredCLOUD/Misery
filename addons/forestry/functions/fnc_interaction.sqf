#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add dynamic actions to terrain objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forestry_fnc_interaction;
 *
*/

[ACE_player, 1, 2] call EFUNC(common,nearEnvironmentSource) params ["_found", "_tree", "_hitPos"];

if (_found) then {

    if (isNull GVAR(activeTreeLogic)) then {
        GVAR(activeTreeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

        GVAR(activeTreeLogic) setPosASL _hitPos;

        private _baseAction = [
            QGVAR(forestryTree_Base_menu),
            localize ECSTRING(common,Interact),
            QPATHTOEF(icons,data\trees_ca.paa),
            {
                params ["", "", "_params"];
            },
            {true},
            {},
            []
        ] call ACEFUNC(interact_menu,createAction);

        private _gatherWoodAction = [
            QGVAR(forestryCollectWood_menu),
            localize LSTRING(CollectWood),
            "a3\ui_f\data\igui\cfg\actions\take_ca.paa",
            {
                params ["", "", "_params"];
                _params params ["_found", "_tree"];
                [_found, _tree] call FUNC(forageTreeAction);
            },
            {true},
            {},
            [_found, _tree]
        ] call ACEFUNC(interact_menu,createAction);

        private _axeAction = [
            QGVAR(forestryChopWood_menu),
            localize LSTRING(ChopDown),
            QPATHTOEF(icons,data\axe_ca.paa),
            {
                params ["", "", "_params"];
                _params params ["_found", "_tree"];
                [_found, _tree] call FUNC(axeAction);
            },
            {
                [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem)
            },
            {},
            [_found, _tree]
        ] call ACEFUNC(interact_menu,createAction);

        private _sawAction = [
            QGVAR(forestrySawWood_menu),
            localize LSTRING(CutDown),
            QPATHTOEF(icons,data\axe_ca.paa),
            {
                params ["", "", "_params"];
                _params params ["_found", "_tree"];
                [_found, _tree] call FUNC(sawAction);
            },
            {
                [[QCLASS(chainsaw)]] call EFUNC(common,hasItem)
            },
            {},
            [_found, _tree]
        ] call ACEFUNC(interact_menu,createAction);

        [GVAR(activeTreeLogic), 0, [QUOTE(ACE_MainActions)], _baseAction] call ACEFUNC(interact_menu,addActionToObject);

        [GVAR(activeTreeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(forestryTree_Base_menu)], _gatherWoodAction] call ACEFUNC(interact_menu,addActionToObject);

        if (GVAR(choppingWood)) then {
            [GVAR(activeTreeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(forestryTree_Base_menu)], _axeAction] call ACEFUNC(interact_menu,addActionToObject);
        };

        if (GVAR(sawingWood)) then {
            [GVAR(activeTreeLogic), 0, [QUOTE(ACE_MainActions), QGVAR(forestryTree_Base_menu)], _sawAction] call ACEFUNC(interact_menu,addActionToObject);
        };
    };

    if (isNull GVAR(activeForagingLogic)) then {
        GVAR(activeForagingLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

        private _treePos = getPosASL _tree;

        GVAR(activeForagingLogic) setPosASL _treePos;

        if (GVAR(foraging)) then {

            private _foragingMenu = [
                QGVAR(foraging_menu),
                localize LSTRING(Forage),
                QPATHTOEF(icons,data\leaf_ca.paa),
                {},
                {true}
            ] call ACEFUNC(interact_menu,createAction);

            private _foragingWormsMenu = [
                QGVAR(foragingWorms_menu),
                localize LSTRING(ForageDigForWorms),
                QPATHTOEF(icons,data\shovel_ca.paa),
                {
                    [] call FUNC(digForWorms)
                },
                {true}
            ] call ACEFUNC(interact_menu,createAction);

            private _foragingTinderMenu = [
                QGVAR(foragingTinder_menu),
                localize LSTRING(ForageSearchForTinder),
                QPATHTOEF(icons,data\leaf_ca.paa),
                {
                    [] call FUNC(searchForTinder)
                },
                {true}
            ] call ACEFUNC(interact_menu,createAction);

            [GVAR(activeForagingLogic), 0, [QUOTE(ACE_MainActions)], _foragingMenu] call ACEFUNC(interact_menu,addActionToObject);

            [GVAR(activeForagingLogic), 0, [QUOTE(ACE_MainActions), QGVAR(foraging_menu)], _foragingWormsMenu] call ACEFUNC(interact_menu,addActionToObject);

            [GVAR(activeForagingLogic), 0, [QUOTE(ACE_MainActions), QGVAR(foraging_menu)], _foragingTinderMenu] call ACEFUNC(interact_menu,addActionToObject);
        };
    };
};

