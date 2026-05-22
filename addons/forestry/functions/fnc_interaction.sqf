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

[{
    params ["_args", "_handle"];

    if (!ACEGVAR(interact_menu,keydown)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        if (!isNull GVAR(activeTreeLogic)) then {
            deleteVehicle GVAR(activeTreeLogic);
            GVAR(activeTreeLogic) = objNull;
        };
        if (!isNull GVAR(activeForagingLogic)) then {
            deleteVehicle GVAR(activeForagingLogic);
            GVAR(activeForagingLogic) = objNull;
        };
    };

    [player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

    if (_found && {_nearestTree isNotEqualTo []}) then {

        private _tree = _nearestTree select 0;

        if (isNull GVAR(activeTreeLogic)) then {
            GVAR(activeTreeLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

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
                    _params params ["_found", "_tree", "_damaged"];
                    [_found, _tree, _damaged] call FUNC(forageTreeAction);
                },
                {true},
                {},
                [_found, _tree, _damaged]
            ] call ACEFUNC(interact_menu,createAction);

            private _axeAction = [
                QGVAR(forestryChopWood_menu),
                localize LSTRING(ChopDown),
                QPATHTOEF(icons,data\axe_ca.paa),
                {
                    params ["", "", "_params"];
                    _params params ["_found", "_tree", "_damaged", "_hasAxe"];
                    [_found, _tree, _damaged, _hasAxe] call FUNC(axeAction);
                },
                {
                    [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem)
                },
                {},
                [_found, _tree, _damaged, _hasAxe]
            ] call ACEFUNC(interact_menu,createAction);

            private _sawAction = [
                QGVAR(forestrySawWood_menu),
                localize LSTRING(CutDown),
                QPATHTOEF(icons,data\axe_ca.paa),
                {
                    params ["", "", "_params"];
                    _params params ["_found", "_tree", "_damaged", "_hasSaw"];
                    [_found, _tree, _damaged, _hasSaw] call FUNC(sawAction);
                },
                {
                    [[QCLASS(chainsaw)]] call EFUNC(common,hasItem)
                },
                {},
                [_found, _tree, _damaged, _hasSaw]
            ] call ACEFUNC(interact_menu,createAction);

            [GVAR(activeTreeLogic), 0, [], _baseAction] call ACEFUNC(interact_menu,addActionToObject);

            [GVAR(activeTreeLogic), 0, [QGVAR(forestryTree_Base_menu)], _gatherWoodAction] call ACEFUNC(interact_menu,addActionToObject);

            if (GVAR(choppingWood)) then {
                [GVAR(activeTreeLogic), 0, [QGVAR(forestryTree_Base_menu)], _axeAction] call ACEFUNC(interact_menu,addActionToObject);
            };

            if (GVAR(sawingWood)) then {
                [GVAR(activeTreeLogic), 0, [QGVAR(forestryTree_Base_menu)], _sawAction] call ACEFUNC(interact_menu,addActionToObject);
            };
        };

        if (isNull GVAR(activeForagingLogic)) then {
            GVAR(activeForagingLogic) = "ACE_LogicDummy" createVehicleLocal [0, 0, 0];

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

                [GVAR(activeForagingLogic), 0, [], _foragingMenu] call ACEFUNC(interact_menu,addActionToObject);

                [GVAR(activeForagingLogic), 0, [QGVAR(foraging_menu)], _foragingWormsMenu] call ACEFUNC(interact_menu,addActionToObject);

                [GVAR(activeForagingLogic), 0, [QGVAR(foraging_menu)], _foragingTinderMenu] call ACEFUNC(interact_menu,addActionToObject);
            };
        };

        private _treePos = getPosASL _tree;
        private _playerPos = getPosASL player;

        private _dirToPlayer = _treePos vectorFromTo _playerPos;

        private _offsetPos = _treePos vectorAdd (_dirToPlayer vectorMultiply 0.5);
        _offsetPos set [2, (_treePos select 2) + 1.2];

        GVAR(activeTreeLogic) setPosASL _offsetPos;

        GVAR(activeForagingLogic) setPosASL _treePos;
    } else {
        if (!isNull GVAR(activeTreeLogic)) then {
            deleteVehicle GVAR(activeTreeLogic);
            GVAR(activeTreeLogic) = objNull;
        };
        if (!isNull GVAR(activeForagingLogic)) then {
            deleteVehicle GVAR(activeForagingLogic);
            GVAR(activeForagingLogic) = objNull;
        };
    };
}, 0] call CBA_fnc_addPerFrameHandler;
