#include "script_component.hpp"

if (GVAR(woodCollection)) then {

    [QCLASSACE(interactMenuOpened), {
        params ["_type"];
        if (_type isNotEqualTo 0) exitWith {};

        [] call FUNC(interaction);
    }] call CBA_fnc_addEventHandler;

    private _forestrySplitLog = [
        QGVAR(forestrySplitLog_menu),
        localize LSTRING(SplitWoodLog),
        QPATHTOEF(icons,data\axe_ca.paa),
        {
            params ["_target", "_player"];
            if !([[QCLASS(woodenlog)]] call EFUNC(common,hasItem)) exitWith {
                [QEGVAR(common,tileText), localize LSTRING(NoWoodenLogsForSplitting)] call CBA_fnc_localEvent;
            };

            private _hasAxe = [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem);
            private _hasSaw = [[QCLASS(chainsaw)]] call EFUNC(common,hasItem);

            if (_hasAxe || _hasSaw) then {
                [_hasAxe, _hasSaw] call FUNC(splitWoodAction);
            } else {
                [QEGVAR(common,tileText), localize LSTRING(NoWoodAxeOrChainsawNoti)] call CBA_fnc_localEvent;
            };
        },
        {
            [[QCLASS(woodenlog)]] call EFUNC(common,hasItem)
        },
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _forestrySplitLog] call ACEFUNC(interact_menu,addActionToObject);
};
