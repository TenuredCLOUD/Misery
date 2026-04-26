#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (!isPlayer _unit && _unit isKindOf "CAManBase") then {

            if ([GVAR(corpseHasMoneyChance)] call EFUNC(common,rollChance)) then {
                private _midAiMoney = GVAR(minAiMoney) + GVAR(maxAiMoney) / 2;
                private _cashFound = floor random [GVAR(minAiMoney), _midAiMoney, GVAR(maxAiMoney)];
                _unit setVariable [QGVAR(funds), _cashFound, true];
            } else {
                _unit setVariable [QGVAR(funds), 0, true];
            };
        };
    }];
};

private _searchForMoneyAction = [
    QGVAR(searchForMoney_menu),
    format ["%1 Search for money", GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyTake_ui);
    },
    {
        params ["_target", "_player"];
        !alive _target
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _giftMoneyAction = [
    QGVAR(giftMoney_menu),
    format ["%1 Gift money", GVAR(symbol)],
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(moneyGive_ui);
    },
    {
        params ["_target", "_player"];
        (alive _target) && (isPlayer _target) && {!(_target isKindOf "WBK_C_ExportClass")}
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

["CAManBase", 0, [QUOTE(ACE_MainActions)], _searchForMoneyAction] call ACEFUNC(interact_menu,addActionToClass);
["CAManBase", 0, [QUOTE(ACE_MainActions)], _giftMoneyAction] call ACEFUNC(interact_menu,addActionToClass);
