#include "script_component.hpp"

GVAR(bankName) = "New World Bank";

["CBA_settingsInitialized", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;

[QGVAR(registerBankGlobal), FUNC(createBanks)] call CBA_fnc_addEventHandler;

[
    "searchForMoney_menu",
    "Search for Money",
    {call FUNC(corpseCondition) isNotEqualTo objNull},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    [] call FUNC(searchCorpse);
    },
    "",
    QGVAR(symbol),
    ""
] call EFUNC(actions,addAction);
