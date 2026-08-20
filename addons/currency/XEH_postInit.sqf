#include "script_component.hpp"

private _searchMoneyAction = [
    QGVAR(searchForMoney_menu),
    format [localize LSTRING(SearchAction), GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyTake_ui);
        [_target] call FUNC(takeMoneyRefresh);
        _player setVariable [QGVAR(searchTarget), _target];
    },
    {
        params ["_target", "_player"];

        private _isAwake = [_target] call ACEFUNC(common,isAwake);
        (!_isAwake || _target getVariable [QACEGVAR(captives,isHandcuffed), false] || _target getVariable [QACEGVAR(captives,isSurrendering), false]) && _target getVariable [QGVAR(canSearch), false];
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

["CAManBase", 0, [QUOTE(ACE_MainActions)], _searchMoneyAction, true] call ACEFUNC(interact_menu,addActionToClass);

private _giftMoneyAction = [
    QGVAR(giftMoney_menu),
    format [localize LSTRING(GiftAction), GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyGive_ui);
        [_target] call FUNC(giveMoneyRefresh);
        _player setVariable [QGVAR(giftRecipient), getPlayerUID _target];
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

["CAManBase", 0, [QUOTE(ACE_MainActions)], _giftMoneyAction, true] call ACEFUNC(interact_menu,addActionToClass);

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

private _player = [] call ACEFUNC(common,player);

[_player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _fundsCheckAction] call ACEFUNC(interact_menu,addActionToObject);

_player setVariable [QGVAR(canSearch), true, true];
