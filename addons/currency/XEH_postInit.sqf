#include "script_component.hpp"

GVAR(searchForMoneyAction) = [
    QGVAR(searchForMoney_menu),
    format [localize LSTRING(SearchAction), GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyTake_ui);
        [_target] call FUNC(takeMoneyRefresh);
    },
    {
        params ["_target", "_player"];
        !alive _target && _target getVariable [QGVAR(canSearch), false];
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _giftMoneyAction = [
    QGVAR(giftMoney_menu),
    format [localize LSTRING(GiftAction), GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyGive_ui);
        [_target] call FUNC(giveMoneyRefresh);
    },
    {
        params ["_target", "_player"];
        (alive _target) && (isPlayer _target)
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

["CAManBase", 0, [QUOTE(ACE_MainActions)], _giftMoneyAction] call ACEFUNC(interact_menu,addActionToClass);

private _fundsCheckAction = [
    QGVAR(check_menu),
    localize LSTRING(CurrentFunds),
    QPATHTOEF(icons,data\wallet_ca.paa),
    {
        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];
        [QEGVAR(common,tileText), format [localize LSTRING(Funds), [_funds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)]] call CBA_fnc_localEvent;
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

[player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _fundsCheckAction] call ACEFUNC(interact_menu,addActionToObject);

if (isServer) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (_unit isKindOf "CAManBase") then {

            if (!isPlayer _unit) then {
                if ([GVAR(corpseHasMoneyChance)] call EFUNC(common,rollChance)) then {
                    private _midAiMoney = GVAR(minAiMoney) + GVAR(maxAiMoney) / 2;
                    private _cashFound = floor random [GVAR(minAiMoney), _midAiMoney, GVAR(maxAiMoney)];
                    _unit setVariable [QGVAR(funds), _cashFound, true];
                } else {
                    _unit setVariable [QGVAR(funds), 0, true];
                };
            };

            if (GVAR(corpseHasMoneyChance) > 0) then {
                [_unit, 0, [QUOTE(ACE_MainActions)], GVAR(searchForMoneyAction)] call ACEFUNC(interact_menu,addActionToObject);
            };
        };
    }];
};
