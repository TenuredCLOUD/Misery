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

[
    "searchForMoney_menu",
    format ["%1 Search for money", GVAR(symbol)],
    {([player, ["CAManBase"], 2] call EFUNC(common,nearCorpse)) select 0},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        player playAction "Gear";
        createDialog QCLASS(moneyTake_ui);
    },
    "",
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    ""
] call EFUNC(actions,addAction);

[
    "giftMoney_menu",
    format ["%1 Gift money", GVAR(symbol)],
    {([player, 2] call EFUNC(common,nearPlayer)) select 0},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        player playAction "Gear";
        createDialog QCLASS(moneyGive_ui);
    },
    "",
    QPATHTOEF(icons,data\hand_helping_ca.paa),
    ""
] call EFUNC(actions,addAction);
